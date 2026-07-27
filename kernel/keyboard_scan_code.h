unsigned char scancode_table[128] = {
0, 27,
'1','2','3','4','5','6','7','8','9','0','-','=','\b','\t',
'q','w','e','r','t','y','u','i','o','p','[',']','\n',0,
'a','s','d','f','g','h','j','k','l',';','\'','`',0,'\\',
'z','x','c','v','b','n','m',',','.','/',0,'*',0,' ',

};
static inline unsigned char inb(unsigned short port){
    unsigned char result;
    __asm__ volatile ("inb %1, %0" : "=a"(result) : "Nd"(port));
    return result;
}
static inline void outb(unsigned short port, unsigned char value){
    __asm__ volatile ("outb %0, %1" : : "a"(value), "Nd"(port));
}
int keyboard_has_data(){
	uint8_t status = inb(0x64);
    return (status & 1) && !(status & (1 << 5));
}
unsigned char read_scancode(){
    return inb(0x60);
}
char keyboard_getchar(){
    if (!keyboard_has_data())
        return 0;
    unsigned char sc = read_scancode();
    if (sc & 0x80)
        return 0;
    if (sc == 0xE0)
        return 0;
    return scancode_table[sc];
}
void kb_input(char* buff){
	while (1){
		int len = strlen(buff);
        if (keyboard_has_data()){
            char kb = keyboard_getchar();
            if (kb == '\b'){
            	if (len)
                	buff[len-1] = '\0';
                bck();}
            if (kb == '\n')
            	break;
            if (kb != 0 && kb != '\b' && kb != '\n'){
                printc(kb, 0x0F);
                if (buff[0] == '\0')
                	len = 0;
                buff[len] = kb;
                buff[len + 1] = '\0';
            }
        }
	}
}