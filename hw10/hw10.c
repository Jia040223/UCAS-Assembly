#include <stdio.h>

unsigned int shld5(unsigned int a, unsigned int b);

int main(){
    unsigned int a = 0x1;
    unsigned int b = 0xffffffff;

    unsigned int c = shld5(a,b);
    printf("Result = %u", c);
}

unsigned int shld5(unsigned int a, unsigned int b)
{
    unsigned int result;
    result = (a << 5) |( b>>(32-5));        //此语句用嵌入式汇编编写
    return result;
}