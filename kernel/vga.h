#define VGA_WIDTH 80
#define VGA_HEIGH 25

volatile uint16_t* vga = (uint16_t*)0xB8000;
uint16_t cursor = 0;
uint16_t cursorx = 0;
uint16_t cursory = 0;

void nl(){
	cursorx = 0;
	cursory++;
}

void putc(char c, uint8_t color) {
    vga[cursory * VGA_WIDTH + cursorx] = (uint16_t)c | (uint16_t)color << 8;
}

void printc(char c, uint8_t color) {
	if (c != '\n')
    	vga[cursory * VGA_WIDTH + cursorx] = (uint16_t)c | (uint16_t)color << 8;
    cursorx += 1;
    if (cursorx > 80 || c == '\n'){
    	nl();
    }
}
void print(const char* s, uint8_t color){
	while (*s) {
		printc(*s++, color);
	}
}
void print_cords(const char* s, uint8_t color, size_t x, size_t y){
	size_t oldx = cursorx;
	size_t oldy = cursory;
	cursorx = x;
	cursory = y;
	while (*s) {
		printc(*s++, color);
	}
	cursorx = oldx;
	cursory = oldy;
}
void print_cords_local(const char* s, uint8_t color, size_t x, size_t y){
	cursorx = x;
	cursory = y;
	while (*s) {
		if (*s != '\n')
    		putc(*s++, color);
    	cursorx += 1;
    	if (cursorx > 80 || *s == '\n'){
    		cursorx = x;
    		cursory++;
    	}
	}
}
void putc_cords(char c, uint8_t color, size_t x, size_t y){
    size_t index = y * VGA_WIDTH + x;
    vga[index] = (uint16_t)c | (uint16_t)color << 8;
}

void puts(const char* s, uint8_t color) {
    while (*s) {
        putc(*s++, color);
    }
}

void return_cur(){
	cursor = 0;
	cursorx = 0;
	cursory = 0;
}

void bck(){
    cursorx--;
    if (cursorx < 1)
    	cursorx = 1;
    vga[cursory * VGA_WIDTH + cursorx] = ' ' | 0x0F;
}

void clr() {
    for (size_t y = 0; y < VGA_HEIGH; y++) {
        for (size_t x = 0; x < VGA_WIDTH; x++) {
            putc_cords(' ', 0x0F, x, y);
        }
    }
    cursor = 0;
    cursorx = 0;
    cursory = 0;
}
char get_char(size_t x,size_t y){
	volatile uint8_t* vga = (uint8_t*)0xB8000;
	return vga[(y * VGA_WIDTH + x) * 2];
}
char get_color(size_t x,size_t y){
	volatile uint8_t* vga = (uint8_t*)0xB8000;
	return vga[(y * VGA_WIDTH + x) * 2 + 1];
}