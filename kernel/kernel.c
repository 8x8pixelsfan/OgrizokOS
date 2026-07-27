__attribute__((section(".multiboot")))
__attribute__((used))
unsigned int multiboot_header[] = {
	0x1BADB002,
	0x0,
	-(0x1BADB002)
};

#include <stddef.h>

typedef unsigned long uint32_t;
typedef unsigned short uint16_t;
typedef unsigned char uint8_t;
typedef signed char int8_t;

#include "vga.h"
#include "strutils.h"
#include "keyboard_scan_code.h"
#include "mouse.h"

char input[100];
static unsigned int seed = 123456789;
int panic = 0;

//'random'
unsigned int rand(){
	seed = seed * 1664525 + 1013904223;
	return seed;
}
int rand_range(int min, int max){
	return (rand() % (max - min) + min);
}

//tui
typedef struct {
	int x;
	int y;
	char text[100];
} TextWidget;
typedef struct {
	int x;
	int y;
	int w;
	int h;
	TextWidget texts[10];
	char title[100];
	int texts_count;
} Window;

Window windows[10];
int windows_count = 0;
int active_window = -1;
Window* dragging = 0;
int drag_offset_x;
int drag_offset_y;

Window SOD = {
	.x = 25,
	.y = 8,
	.w = 31,
	.h = 8,
	.texts = {
		//TextWidget i0 = {
		//	.x = 3,
		//	.y = 2,
		//	.text = "OS is ran into fatal error."
		//},
		//TextWidget i1 = {
		//	.x = 3,
		//	.y = 3,
		//	.text = "reboot manualy, halting..."
		//}
	},
	.title = "FATAL ERROR",
	.texts_count = 0
};

void create_window(int w, int h, const char* title){
	Window* win = &windows[windows_count++];
	win->x = rand_range(0, VGA_WIDTH-w);
	win->y = rand_range(0, VGA_HEIGH-h);
	win->h = h;
	win->w = w;
	strcpy(win->title, title);
}
void draw_window(Window* win){
	int x = win->x;
	int y = win->y;
	int h = win->h;
	int w = win->w;
	TextWidget* texts = win->texts;
	const char* title = win->title;
	
	putc_cords('+', 0x8F, x,y);
	putc_cords('+', 0x8F, x+w-1,y);
	putc_cords('+', 0x8F, x,y+h-1);
	putc_cords('+', 0x8F, x+w-1,y+h-1);
	for (int i = 1; i < w - 1; i++){
		putc_cords('-', 0x8F, x+i,y);
		putc_cords('-', 0x8F, x+i,y+h-1);
	}
	print_cords(title, 0x8F, x + 2, y);
	for (int i = 1; i < h - 1;i++){
		putc_cords('|', 0x8F, x,y+i);
		putc_cords('|', 0x8F, x+w-1,y+i);
	}
	for (int bx = 1; bx < w - 1; bx++){
		for (int by = 1; by < h - 1; by++)
			putc_cords(' ', 0x7F, x + bx, y + by);
	}
	for (int i = 0; i < win->texts_count;i++){
		int tx = texts[i].x;
		int ty = texts[i].y;
		char* text = texts[i].text;
		print_cords(text, 0x7F, x + tx, y + ty);
	}
	//print_cords("Cool looking window", 0x0F, x + 3, y + 2);
}

Window* get_window_at(int x, int y) {
	for (int i = windows_count - 1; i >= 0; i--){
		Window* w = &windows[i];
		if (x >= w->x && x < w->x + w->w && y >= w->y && y < w->y + w->h){
			return w;
		}
	}
	return 0;
}
int find_window_index(Window* w) {
	for (int i = 0; i < windows_count; i++) {
		if (&windows[i] == w)
			return i;
	}
	return -1;
}
void bring_window_to_front(int index){
	Window temp = windows[index];
	for (int i = index; i < windows_count - 1; i++){
		windows[i] = windows[i + 1];
	}
	windows[windows_count - 1] = temp;
}
void render_input(){
	putc_cords('>', 0x0B, 0, 0);
	print_cords_local(input, 0x0F, 1, 0);
}
void render_windows(){
	for (int i = 0; i < windows_count; i++){
		draw_window(&windows[i]);
	}
}
void erease_windows(){
	for (int i = 0; i < windows_count; i++){
		const int x = windows[i].x;
		const int y = windows[i].y;
		const int h = windows[i].h;
		const int w = windows[i].w;
		for (int i = x - 1; i < x + w + 1; i++){
			for (int i2 = y - 1; i < y + h + 1; i2++){
				putc_cords('a', 0x0F, i, i2);
			} 
		}
	}
}

void add_text_wdgt(int x, int y, const char* str, Window* win){
	TextWidget* t = &win->texts[win->texts_count++];
	t->x = x;
	t->y = y;
	strcpy(t->text, str);
}

void drawbar() {
    for (size_t x = 0; x < VGA_WIDTH; x++) {
        putc_cords('=', 0x0A, x, 0);
    }
}
//'apps'
typedef void (*AppFunc)(int argc, char** argv);

typedef struct {
	const char* name;
	AppFunc func;
} App;
App apps[10];
int apps_count = 0;

void register_app(const char* name, AppFunc func){
	if (apps_count >= 10)
		return;
	apps[apps_count].name = name;
	apps[apps_count].func = func;
	apps_count++;
}
App* find_app(const char* name){
	for (int i = 0; i < apps_count; i++){
		if (cmpstr(apps[i].name, name))
			return &apps[i];
	}
	return 0;
}
void run_app(int argc, char** argv){
	if (argc == 0)
		return;
	App* app = find_app(argv[0]);
	if (!app){
		print("App not found\n", 0x0C);
		return;
	}
	app->func(argc, argv);
}
void app_hello_world(int argc, char** argv){
	print("hello world!\n", 0x0F);
}
void app_fancy_hello_world(int argc, char** argv){
	create_window(25,5,"Hello World");
	add_text_wdgt(5,2,"Hello world!",&windows[windows_count-1]);
}
void app_echo(int argc, char** argv){
	for (int i = 1; i < argc; i++){
		print(argv[i], 0x0F);
		print(" ",0x0F);
	}
	print("\n",0x0F);
}
void app_hello_name(int argc, char** argv){
	print("Hello! What is your name?\nenter your name:", 0x0F);
	char inpt[100];
	kb_input(inpt);
	nl();
	print(inpt, 0x0F);
	print(", nice to meet you!\n", 0x0F);
                
}
//important shi
void* memcpy(void* dest, const void* src, unsigned int n){
	unsigned char* d = dest;
	const unsigned char* s = src;
	while (n--)
		*d++ = *s++;
	return dest;
}
void kernel_main() {
	windows[0] = windows[0];
	//important for graphics
	inb(0x3DA);
	outb(0x3C0, 0x30);
	uint8_t val = inb(0x3C1);
	outb(0x3C0, val & ~0x08);
	
	print("Initing mouse...\n", 0x0F);
	mouse_init();
	print("Loading built-in apps...\n", 0x0F);
	register_app("echo", app_echo);
	register_app("hello-world", app_hello_world);
	register_app("fancy-hello-world", app_fancy_hello_world);
	register_app("hello-name", app_hello_name);
	print("Doing something useless...\n", 0x0F);
	//add_text_wdgt(2,3,"Cool looking window",&w);
	add_text_wdgt(2,3,"OS is ran into fatal error.",&SOD);
	add_text_wdgt(2,4,"Reboot manualy, halting...",&SOD);
    clr();
    //drawbar();
    //draw_window(&w);
    return_cur();
    print("OgrizokOS v0.no\nI`m not resposible for anything\n", 0x0F);
	printc('>', 0x0B);
    while (1) {
    	//mouse
    	uint8_t mstatus = inb(0x64);
    	if (mstatus & 1){
    		if (mstatus & (1 << 5)){
    			mouse_handler();
    		}
    	}
    	if (dragging) {
    		//erease_windows();
    		clr();
    		dragging->x = mousex - drag_offset_x;
    		dragging->y = mousey - drag_offset_y;
    		render_windows();
			render_input();
    	}
    	if (mouse_left_press && !dragging) {
    		Window* w = get_window_at(mousex, mousey);
    		if (w) {
    			//erease_windows();
    			drag_offset_x = mousex - w->x;
    			drag_offset_y = mousey - w->y;
    			int index = find_window_index(w);
    			active_window = index;
    			bring_window_to_front(index);
    			dragging = &windows[windows_count - 1];
    			render_windows();
    		}
    	}
    	if (!mouse_left){
    		dragging = 0;
    	}
    	int len = strlen(input);
        if (keyboard_has_data()){
            char kb = keyboard_getchar();
            if (kb == '\b'){
            	if (len)
                	input[len-1] = '\0';
                bck();}
            if (kb == '\n'){
         		//nl();
         		clr();
         		char* input_parts[5];
         		int input_parts_count = split(input, ' ', input_parts, 5);
         		if (cmpstr(input_parts[0],"help")){
         			print("help - help\nabout - about os\nclear - clear screen\nwin <title> - open new window\nclose - close window\nlsapps - list of all apps\nrun <app> - run app\npanic - make os panic and halt\n", 0x0A);}
         		else if (cmpstr(input_parts[0],"about")){
         			print("OgrizokOS v0.no\nI`m not resposible for anything\n", 0x0A);}
         		else if (cmpstr(input_parts[0],"clear")){
         			clr();}
         		else if (cmpstr(input_parts[0],"win"))
         			create_window(30,9,input_parts[1]);
         		else if (cmpstr(input_parts[0],"close")){
         			windows_count--;
         			windows[windows_count].texts_count = 0;}
         		else if (cmpstr(input_parts[0],"lsapps")){
         			print("list of apps:\n", 0x0A);
         			for (int i = 0; i < apps_count; i++){
         				print(apps[i].name, 0x0F);
         				nl();
         			}
         		}
         		else if (cmpstr(input_parts[0],"run"))
         			run_app(input_parts_count - 1, &input_parts[1]);
         		else if (cmpstr(input_parts[0], "erease"))
         			erease_windows();
         		else if (cmpstr(input_parts[0],"panic")){
         			print("Aaaaaa! Halting! Now!\n", 0x0A);
         			panic = 1;}
         		else
         			print("unknown\n", 0x0C);
         		render_windows();
         		//nl();
         		input[0] = '\0';
            	printc('>', 0x0B);
            	//draw_window(&w);
            }
            if (kb != 0 && kb != '\b' && kb != '\n'){
                printc(kb, 0x0F);
                if (input[0] == '\0')
                	len = 0;
                input[len] = kb;
                input[len + 1] = '\0';
            }

        }
        putc_cords('^', last_col, mousex, mousey);
        if (panic){
            draw_window(&SOD);
    		while (1) __asm__("hlt");} 
    }
}
