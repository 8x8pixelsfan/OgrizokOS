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
int keyboard_has_data(){
    return inb(0x64) & 1;
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