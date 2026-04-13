int cmpstr(const char* a, const char* b){
	while (*a && *b){
		if (*a != *b)
			return 0;
		a++;
		b++;
	}
	return (*a == 0 && *b == 0);
}
int strlen(const char* s){
	int len = 0;
	while (s[len])
		len++;
	return len;
}
void strcat(char* a, const char* b){
	while (*b){
		int len = strlen(a);
        a[len] = *b;
        a[len + 1] = '\0';
        //*b++;
	}
}
int split(char* str, char sep, char* parts[], int max_parts){
	int count = 0;
	while (*str && count < max_parts){
		parts[count++] = str;
		while (*str && *str != sep)
			str++;
		if (*str == sep){
			*str = '\0';
			str++;
		}
	}
	return count;
}
void strcpy(char* dst, const char* src){
	while (*src){
		*dst++ = *src++;
	}
	*dst = 0;
}