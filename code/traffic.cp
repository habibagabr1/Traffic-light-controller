#line 1 "D:/Embedded training/final proj/code/traffic.c"
signed char countw=0,counts=0;
char i=0;
void counter(signed char count ){
 char diget1w=count%10;
 char diget2w=count/10 ;

 portc.b2=portc.b0 =0;
 portc.B3=portc.B1= 1;
 portb=diget1w;
 delay_ms(100);
 portc.b2=portc.b0=1;
 portc.b3=portc.B1=0;
 portb=diget2w;
 delay_ms(100);
 portc=0;
}
void counter_m(signed char count){
char diget1w=count%10;
 char diget2w=count/10 ;
 if(porte.B0==1&&porte.B1==0){
 portc=0b00000010;
 portb=diget1w;
 delay_ms(100);
 portc=0b00000001;
 portb=diget2w;
 delay_ms(100);
 portc=0;
 }
 else if(porte.B0==1&&porte.B1==1){
 portc=0b00001000;
 portb=diget1w;
 delay_ms(100);
 portc=0b00000100;
 portb=diget2w;
 delay_ms(100);
 portc=0;
 }
}
void main(){
 adcon1=0x06;
 trisa=trisb=trisc=0;
 trise=trisd=0xff;
 for(;;){
 portc=0;
 porta=255;
 while(porte.B0==0){
 porta.B3=1;
 porta.B2=1;
 for(countw=15;countw>0;countw--){
 for(i=5;i>0;i--){
 porta.B0=0;
 if(countw>12){
 porta.b4=0;
 }
 if(countw<=12){
 porta.b4=1;
 porta.B5=0;
 }
 counter(countw);}
 }
 porta.B5=1;
 porta.B0=1;
 for(countw=3;countw>0;countw--){
 for(i=5;i>0;i--){
 porta.B3=0;
 porta.B1=0;
 counter(countw);
 } }
 porta.B1=1;
 for(countw=20;countw>0;countw--){

 for(i=5;i>0;i--){
 porta.B3=0;
 porta.B2=0;
 counter(countw);
 }
 }
 }


 counts=0 ;
while(porte.B1==0 && porte.B0==1){


 if(counts==0){
 porta=0b11110111;
 for(countw=3;countw>0;countw--){
 for(i=5;i>0;i--){
 porta.B1=0;
 counter_m(countw);

 }}porta=0b11110111;
 }
 counts=1;
 portc=0;
 porta=0b11110011;

 }
 counts=0;
 while(porte.B1==1 && porte.B0==1){
 if(counts==0){
 porta=0b11111110;
 for(countw=3;countw>0;countw--){
 for(i=5;i>0;i--){
 porta.b4=0;
 counter_m(countw);
 counts=1;
 }}porta.b4=0b11111110;
 }
 counts=1;
 portc=0;

 porta=0b11011110;

 } } }
