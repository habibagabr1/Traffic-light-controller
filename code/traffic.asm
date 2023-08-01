
_counter:

;traffic.c,3 :: 		void counter(signed char count ){
;traffic.c,4 :: 		char diget1w=count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__counter+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
;traffic.c,5 :: 		char diget2w=count/10 ;
	MOVF       R0+0, 0
	MOVWF      counter_diget2w_L0+0
;traffic.c,7 :: 		portc.b2=portc.b0 =0; // seg off
	BCF        PORTC+0, 0
	BTFSC      PORTC+0, 0
	GOTO       L__counter65
	BCF        PORTC+0, 2
	GOTO       L__counter66
L__counter65:
	BSF        PORTC+0, 2
L__counter66:
;traffic.c,8 :: 		portc.B3=portc.B1= 1;  //  seg on
	BSF        PORTC+0, 1
	BTFSC      PORTC+0, 1
	GOTO       L__counter67
	BCF        PORTC+0, 3
	GOTO       L__counter68
L__counter67:
	BSF        PORTC+0, 3
L__counter68:
;traffic.c,9 :: 		portb=diget1w;
	MOVF       FLOC__counter+0, 0
	MOVWF      PORTB+0
;traffic.c,10 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_counter0:
	DECFSZ     R13+0, 1
	GOTO       L_counter0
	DECFSZ     R12+0, 1
	GOTO       L_counter0
	DECFSZ     R11+0, 1
	GOTO       L_counter0
	NOP
;traffic.c,11 :: 		portc.b2=portc.b0=1;
	BSF        PORTC+0, 0
	BTFSC      PORTC+0, 0
	GOTO       L__counter69
	BCF        PORTC+0, 2
	GOTO       L__counter70
L__counter69:
	BSF        PORTC+0, 2
L__counter70:
;traffic.c,12 :: 		portc.b3=portc.B1=0;
	BCF        PORTC+0, 1
	BTFSC      PORTC+0, 1
	GOTO       L__counter71
	BCF        PORTC+0, 3
	GOTO       L__counter72
L__counter71:
	BSF        PORTC+0, 3
L__counter72:
;traffic.c,13 :: 		portb=diget2w;
	MOVF       counter_diget2w_L0+0, 0
	MOVWF      PORTB+0
;traffic.c,14 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_counter1:
	DECFSZ     R13+0, 1
	GOTO       L_counter1
	DECFSZ     R12+0, 1
	GOTO       L_counter1
	DECFSZ     R11+0, 1
	GOTO       L_counter1
	NOP
;traffic.c,15 :: 		portc=0;
	CLRF       PORTC+0
;traffic.c,16 :: 		}
L_end_counter:
	RETURN
; end of _counter

_counter_m:

;traffic.c,17 :: 		void counter_m(signed char count){
;traffic.c,18 :: 		char diget1w=count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_m_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      counter_m_diget1w_L0+0
;traffic.c,19 :: 		char diget2w=count/10 ;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_m_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R0+0, 0
	MOVWF      counter_m_diget2w_L0+0
;traffic.c,20 :: 		if(porte.B0==1&&porte.B1==0){
	BTFSS      PORTE+0, 0
	GOTO       L_counter_m4
	BTFSC      PORTE+0, 1
	GOTO       L_counter_m4
L__counter_m61:
;traffic.c,21 :: 		portc=0b00000010;
	MOVLW      2
	MOVWF      PORTC+0
;traffic.c,22 :: 		portb=diget1w;
	MOVF       counter_m_diget1w_L0+0, 0
	MOVWF      PORTB+0
;traffic.c,23 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_counter_m5:
	DECFSZ     R13+0, 1
	GOTO       L_counter_m5
	DECFSZ     R12+0, 1
	GOTO       L_counter_m5
	DECFSZ     R11+0, 1
	GOTO       L_counter_m5
	NOP
;traffic.c,24 :: 		portc=0b00000001;
	MOVLW      1
	MOVWF      PORTC+0
;traffic.c,25 :: 		portb=diget2w;
	MOVF       counter_m_diget2w_L0+0, 0
	MOVWF      PORTB+0
;traffic.c,26 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_counter_m6:
	DECFSZ     R13+0, 1
	GOTO       L_counter_m6
	DECFSZ     R12+0, 1
	GOTO       L_counter_m6
	DECFSZ     R11+0, 1
	GOTO       L_counter_m6
	NOP
;traffic.c,27 :: 		portc=0;
	CLRF       PORTC+0
;traffic.c,28 :: 		}
	GOTO       L_counter_m7
L_counter_m4:
;traffic.c,29 :: 		else if(porte.B0==1&&porte.B1==1){
	BTFSS      PORTE+0, 0
	GOTO       L_counter_m10
	BTFSS      PORTE+0, 1
	GOTO       L_counter_m10
L__counter_m60:
;traffic.c,30 :: 		portc=0b00001000;
	MOVLW      8
	MOVWF      PORTC+0
;traffic.c,31 :: 		portb=diget1w;
	MOVF       counter_m_diget1w_L0+0, 0
	MOVWF      PORTB+0
;traffic.c,32 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_counter_m11:
	DECFSZ     R13+0, 1
	GOTO       L_counter_m11
	DECFSZ     R12+0, 1
	GOTO       L_counter_m11
	DECFSZ     R11+0, 1
	GOTO       L_counter_m11
	NOP
;traffic.c,33 :: 		portc=0b00000100;
	MOVLW      4
	MOVWF      PORTC+0
;traffic.c,34 :: 		portb=diget2w;
	MOVF       counter_m_diget2w_L0+0, 0
	MOVWF      PORTB+0
;traffic.c,35 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_counter_m12:
	DECFSZ     R13+0, 1
	GOTO       L_counter_m12
	DECFSZ     R12+0, 1
	GOTO       L_counter_m12
	DECFSZ     R11+0, 1
	GOTO       L_counter_m12
	NOP
;traffic.c,36 :: 		portc=0;
	CLRF       PORTC+0
;traffic.c,37 :: 		}
L_counter_m10:
L_counter_m7:
;traffic.c,38 :: 		}
L_end_counter_m:
	RETURN
; end of _counter_m

_main:

;traffic.c,39 :: 		void main(){
;traffic.c,40 :: 		adcon1=0x06;        //convert from analog to degital (A&E)
	MOVLW      6
	MOVWF      ADCON1+0
;traffic.c,41 :: 		trisa=trisb=trisc=0; //output
	CLRF       TRISC+0
	MOVF       TRISC+0, 0
	MOVWF      TRISB+0
	MOVF       TRISB+0, 0
	MOVWF      TRISA+0
;traffic.c,42 :: 		trise=trisd=0xff;          //input
	MOVLW      255
	MOVWF      TRISD+0
	MOVF       TRISD+0, 0
	MOVWF      TRISE+0
;traffic.c,43 :: 		for(;;){
L_main13:
;traffic.c,44 :: 		portc=0;
	CLRF       PORTC+0
;traffic.c,45 :: 		porta=255;             //all leds off
	MOVLW      255
	MOVWF      PORTA+0
;traffic.c,46 :: 		while(porte.B0==0){
L_main16:
	BTFSC      PORTE+0, 0
	GOTO       L_main17
;traffic.c,47 :: 		porta.B3=1; //reds off
	BSF        PORTA+0, 3
;traffic.c,48 :: 		porta.B2=1; //greenw off
	BSF        PORTA+0, 2
;traffic.c,49 :: 		for(countw=15;countw>0;countw--){
	MOVLW      15
	MOVWF      _countw+0
L_main18:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _countw+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main19
;traffic.c,50 :: 		for(i=5;i>0;i--){
	MOVLW      5
	MOVWF      _i+0
L_main21:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main22
;traffic.c,51 :: 		porta.B0=0; // redw on
	BCF        PORTA+0, 0
;traffic.c,52 :: 		if(countw>12){
	MOVLW      128
	XORLW      12
	MOVWF      R0+0
	MOVLW      128
	XORWF      _countw+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main24
;traffic.c,53 :: 		porta.b4=0; //yells on
	BCF        PORTA+0, 4
;traffic.c,54 :: 		}
L_main24:
;traffic.c,55 :: 		if(countw<=12){
	MOVLW      128
	XORLW      12
	MOVWF      R0+0
	MOVLW      128
	XORWF      _countw+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main25
;traffic.c,56 :: 		porta.b4=1; //yells off
	BSF        PORTA+0, 4
;traffic.c,57 :: 		porta.B5=0;//greens on
	BCF        PORTA+0, 5
;traffic.c,58 :: 		}
L_main25:
;traffic.c,59 :: 		counter(countw);}
	MOVF       _countw+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;traffic.c,50 :: 		for(i=5;i>0;i--){
	DECF       _i+0, 1
;traffic.c,59 :: 		counter(countw);}
	GOTO       L_main21
L_main22:
;traffic.c,49 :: 		for(countw=15;countw>0;countw--){
	DECF       _countw+0, 1
;traffic.c,60 :: 		}
	GOTO       L_main18
L_main19:
;traffic.c,61 :: 		porta.B5=1;//greens off
	BSF        PORTA+0, 5
;traffic.c,62 :: 		porta.B0=1; //red off
	BSF        PORTA+0, 0
;traffic.c,63 :: 		for(countw=3;countw>0;countw--){
	MOVLW      3
	MOVWF      _countw+0
L_main26:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _countw+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main27
;traffic.c,64 :: 		for(i=5;i>0;i--){
	MOVLW      5
	MOVWF      _i+0
L_main29:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main30
;traffic.c,65 :: 		porta.B3=0; //reds on
	BCF        PORTA+0, 3
;traffic.c,66 :: 		porta.B1=0;// yellow 0n
	BCF        PORTA+0, 1
;traffic.c,67 :: 		counter(countw);
	MOVF       _countw+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;traffic.c,64 :: 		for(i=5;i>0;i--){
	DECF       _i+0, 1
;traffic.c,68 :: 		}     }
	GOTO       L_main29
L_main30:
;traffic.c,63 :: 		for(countw=3;countw>0;countw--){
	DECF       _countw+0, 1
;traffic.c,68 :: 		}     }
	GOTO       L_main26
L_main27:
;traffic.c,69 :: 		porta.B1=1;// yellow off
	BSF        PORTA+0, 1
;traffic.c,70 :: 		for(countw=20;countw>0;countw--){
	MOVLW      20
	MOVWF      _countw+0
L_main32:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _countw+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;traffic.c,72 :: 		for(i=5;i>0;i--){
	MOVLW      5
	MOVWF      _i+0
L_main35:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main36
;traffic.c,73 :: 		porta.B3=0; //reds on
	BCF        PORTA+0, 3
;traffic.c,74 :: 		porta.B2=0; // green on
	BCF        PORTA+0, 2
;traffic.c,75 :: 		counter(countw);
	MOVF       _countw+0, 0
	MOVWF      FARG_counter_count+0
	CALL       _counter+0
;traffic.c,72 :: 		for(i=5;i>0;i--){
	DECF       _i+0, 1
;traffic.c,76 :: 		}
	GOTO       L_main35
L_main36:
;traffic.c,70 :: 		for(countw=20;countw>0;countw--){
	DECF       _countw+0, 1
;traffic.c,77 :: 		}
	GOTO       L_main32
L_main33:
;traffic.c,78 :: 		}
	GOTO       L_main16
L_main17:
;traffic.c,81 :: 		counts=0  ;
	CLRF       _counts+0
;traffic.c,82 :: 		while(porte.B1==0 && porte.B0==1){
L_main38:
	BTFSC      PORTE+0, 1
	GOTO       L_main39
	BTFSS      PORTE+0, 0
	GOTO       L_main39
L__main63:
;traffic.c,85 :: 		if(counts==0){
	MOVF       _counts+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main42
;traffic.c,86 :: 		porta=0b11110111; //reds on
	MOVLW      247
	MOVWF      PORTA+0
;traffic.c,87 :: 		for(countw=3;countw>0;countw--){
	MOVLW      3
	MOVWF      _countw+0
L_main43:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _countw+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main44
;traffic.c,88 :: 		for(i=5;i>0;i--){
	MOVLW      5
	MOVWF      _i+0
L_main46:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main47
;traffic.c,89 :: 		porta.B1=0;// yellow on
	BCF        PORTA+0, 1
;traffic.c,90 :: 		counter_m(countw);
	MOVF       _countw+0, 0
	MOVWF      FARG_counter_m_count+0
	CALL       _counter_m+0
;traffic.c,88 :: 		for(i=5;i>0;i--){
	DECF       _i+0, 1
;traffic.c,92 :: 		}}porta=0b11110111;// yellow off & reds on
	GOTO       L_main46
L_main47:
;traffic.c,87 :: 		for(countw=3;countw>0;countw--){
	DECF       _countw+0, 1
;traffic.c,92 :: 		}}porta=0b11110111;// yellow off & reds on
	GOTO       L_main43
L_main44:
	MOVLW      247
	MOVWF      PORTA+0
;traffic.c,93 :: 		}
L_main42:
;traffic.c,94 :: 		counts=1;
	MOVLW      1
	MOVWF      _counts+0
;traffic.c,95 :: 		portc=0;
	CLRF       PORTC+0
;traffic.c,96 :: 		porta=0b11110011;//green on& reds on
	MOVLW      243
	MOVWF      PORTA+0
;traffic.c,98 :: 		}
	GOTO       L_main38
L_main39:
;traffic.c,99 :: 		counts=0;
	CLRF       _counts+0
;traffic.c,100 :: 		while(porte.B1==1 && porte.B0==1){
L_main49:
	BTFSS      PORTE+0, 1
	GOTO       L_main50
	BTFSS      PORTE+0, 0
	GOTO       L_main50
L__main62:
;traffic.c,101 :: 		if(counts==0){
	MOVF       _counts+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main53
;traffic.c,102 :: 		porta=0b11111110; //red on
	MOVLW      254
	MOVWF      PORTA+0
;traffic.c,103 :: 		for(countw=3;countw>0;countw--){
	MOVLW      3
	MOVWF      _countw+0
L_main54:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _countw+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main55
;traffic.c,104 :: 		for(i=5;i>0;i--){
	MOVLW      5
	MOVWF      _i+0
L_main57:
	MOVF       _i+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main58
;traffic.c,105 :: 		porta.b4=0; //yells on
	BCF        PORTA+0, 4
;traffic.c,106 :: 		counter_m(countw);
	MOVF       _countw+0, 0
	MOVWF      FARG_counter_m_count+0
	CALL       _counter_m+0
;traffic.c,107 :: 		counts=1;
	MOVLW      1
	MOVWF      _counts+0
;traffic.c,104 :: 		for(i=5;i>0;i--){
	DECF       _i+0, 1
;traffic.c,108 :: 		}}porta.b4=0b11111110; //yells off & red on
	GOTO       L_main57
L_main58:
;traffic.c,103 :: 		for(countw=3;countw>0;countw--){
	DECF       _countw+0, 1
;traffic.c,108 :: 		}}porta.b4=0b11111110; //yells off & red on
	GOTO       L_main54
L_main55:
	BCF        PORTA+0, 4
;traffic.c,109 :: 		}
L_main53:
;traffic.c,110 :: 		counts=1;
	MOVLW      1
	MOVWF      _counts+0
;traffic.c,111 :: 		portc=0;
	CLRF       PORTC+0
;traffic.c,113 :: 		porta=0b11011110;//greens on & red on
	MOVLW      222
	MOVWF      PORTA+0
;traffic.c,115 :: 		}           }              }
	GOTO       L_main49
L_main50:
	GOTO       L_main13
L_end_main:
	GOTO       $+0
; end of _main
