__attribute__((section(".multiboot")))
__attribute__((used))
unsigned int multiboot_header[] = {
	0x1BADB002,
	0x0,
	-(0x1BADB002)
};

#include <stddef.h>

typedef unsigned short uint16_t;
typedef unsigned char uint8_t;

#include "vga.h"
#include "keyboard_scan_code.h"
#include "strutils.h"

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
	const char title[100];
	int texts_count;
} Window;

Window windows[10];
windows_count = 0;
active_window = -1;

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

void render_windows(){
	for (int i = 0; i < windows_count; i++){
		draw_window(&windows[i]);
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
typedef void (*AppFunc)();

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
void run_app(const char* name){
	App* app = find_app(name);
	if (!app){
		print("App not found\n", 0x0C);
		return;
	}
	app->func();
}
void app_hello_world(){
	print("hello world!\n", 0x0F);
}
void app_fancy_hello_world(){
	create_window(25,5,"Hello World");
	add_text_wdgt(5,2,"Hello world!",&windows[windows_count-1]);
}

void kernel_main() {
	register_app("hello-world", app_hello_world);
	register_app("fancy-hello-world", app_fancy_hello_world);
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
         		int input_parts_count = split(input, ' ', input_parts, 2);
         		if (cmpstr(input_parts[0],"help")){
         			print("help - help\nabout - about os\nclear - clear screen\nwin <title> - open new window\nclose - close window\nlsapps - list of all apps\nrun <app> - run app\npanic - make os panic and halt\n", 0x0A);}
         		else if (cmpstr(input_parts[0],"about")){
         			print("OgrizokOS v0.no\nI`m not resposible for anything\n", 0x0A);}
         		else if (cmpstr(input_parts[0],"clear")){
         			clr();}
         		else if (cmpstr(input_parts[0],"win"))
         			create_window(30,9,input_parts[1]);
         		else if (cmpstr(input_parts[0],"close"))
         			windows_count--;
         		else if (cmpstr(input_parts[0],"lsapps")){
         			print("list of apps:\n", 0x0A);
         			for (int i = 0; i < apps_count; i++){
         				print(apps[i].name, 0x0F);
         				nl();
         			}
         		}
         		else if (cmpstr(input_parts[0],"run"))
         			run_app(input_parts[1]);
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
            if (panic){
            	draw_window(&SOD);
    			while (1) __asm__("hlt");} 
        }
    }
}
