uint8_t mouse_packets[3];
int mouse_cycle = 0;
int mouse_left;
int mousex = 40;
int mousey = 12;
char last_sym;
uint8_t last_col;

void mouse_wait(int type){
	uint32_t timeout = 100000;
	if (type == 0){
		while (timeout-- && (inb(0x64) & 2));
	}
	else{
		while (timeout-- && !(inb(0x64) & 1));
	}
}
void mouse_write(uint8_t data){
	mouse_wait(0);
	outb(0x64, 0xD4);
	mouse_wait(0);
	outb(0x60, data);
}
uint8_t mouse_read(){
	mouse_wait(1);
	return inb(0x60);
}
void mouse_init(){
	mouse_wait(0);
	outb(0x64, 0xA8);
	mouse_wait(0);
	outb(0x64, 0x20);
	mouse_wait(0);
	uint8_t status = inb(0x60);
	status |= 2;
	mouse_wait(0);
	outb(0x64, 0x60);
	mouse_wait(0);
	outb(0x60, status);
	
	mouse_write(0xF6);
	mouse_read();
	mouse_write(0xF4);
	mouse_read();
}
void mouse_handler(){
	uint8_t data = inb(0x60);
	mouse_packets[mouse_cycle++] = data;
	if (mouse_cycle == 3){
		int button = (int8_t)mouse_packets[0];
		int dx = (int8_t)mouse_packets[1];
		int dy = (int8_t)mouse_packets[2];
		putc_cords(last_sym, last_col, mousex, mousey);
		if (button & 1) {
			mouse_left = 1;
		}
		else {
			mouse_left = 0;
		}
		mousex += dx / 5;
		mousey -= dy / 5;
		if (mousex < 0) mousex = 0;
		if (mousey < 0) mousey = 0;
		if (mousex >= 80) mousex = 79;
		if (mousey >= 25) mousey = 24;
		last_sym = get_char(mousex, mousey);
        last_col = get_color(mousex, mousey);
		mouse_cycle = 0;
	}
}