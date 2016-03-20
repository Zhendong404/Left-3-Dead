///////////////////////////////////////////////////////////////////////////////
//                                                                            /
// IAR ANSI C/C++ Compiler V6.30.1.53127/W32 for ARM    16/Nov/2014  15:25:33 /
// Copyright 1999-2011 IAR Systems AB.                                        /
//                                                                            /
//    Cpu mode     =  thumb                                                   /
//    Endian       =  little                                                  /
//    Source file  =  D:\IAR_TEST\Sirius\Sirius V2.2\src\Sources\C\SD_C\mypri /
//                    ntp.c                                                   /
//    Command line =  "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.2\src\Sources\C\SD_C\myprintp.c" -D IAR -D           /
//                    TWR_K60N512 -lCN "D:\IAR_TEST\Sirius\Sirius             /
//                    V2.2\bin\Flash\List\" -lB "D:\IAR_TEST\Sirius\Sirius    /
//                    V2.2\bin\Flash\List\" -o "D:\IAR_TEST\Sirius\Sirius     /
//                    V2.2\bin\Flash\Obj\" --no_cse --no_unroll --no_inline   /
//                    --no_code_motion --no_tbaa --no_clustering              /
//                    --no_scheduling --debug --endian=little                 /
//                    --cpu=Cortex-M4 -e --fpu=None --dlib_config             /
//                    "C:\Program Files (x86)\IAR Systems\Embedded Workbench  /
//                    6.3\arm\INC\c\DLib_Config_Normal.h" -I                  /
//                    "D:\IAR_TEST\Sirius\Sirius V2.2\src\Sources\H\" -I      /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.2\src\Sources\H\Component_H\" -I                     /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.2\src\Sources\H\Frame_H\" -I                         /
//                    "D:\IAR_TEST\Sirius\Sirius                              /
//                    V2.2\src\Sources\H\Function_H\" -I                      /
//                    "D:\IAR_TEST\Sirius\Sirius V2.2\src\Sources\H\SD_H\"    /
//                    -Ol --use_c++_inline                                    /
//    List file    =  D:\IAR_TEST\Sirius\Sirius V2.2\bin\Flash\List\myprintp. /
//                    s                                                       /
//                                                                            /
//                                                                            /
///////////////////////////////////////////////////////////////////////////////

        NAME myprintp

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy4
        EXTERN strlen

        PUBLIC PortToOut
        PUBLIC Print_Init
        PUBLIC _LocaleC_isupper
        PUBLIC _LocaleC_tolower
        PUBLIC isdigit
        PUBLIC printp
        PUBLIC tolower

// D:\IAR_TEST\Sirius\Sirius V2.2\src\Sources\C\SD_C\myprintp.c
//    1 #include	"myprintp.h"

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP _LocaleC_isupper
        THUMB
// __intrinsic __nounwind __interwork __softfp int _LocaleC_isupper(int)
_LocaleC_isupper:
        SUBS     R0,R0,#+65
        CMP      R0,#+26
        BCS.N    ??_LocaleC_isupper_0
        MOVS     R0,#+1
        B.N      ??_LocaleC_isupper_1
??_LocaleC_isupper_0:
        MOVS     R0,#+0
??_LocaleC_isupper_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP _LocaleC_tolower
        THUMB
// __intrinsic __nounwind __interwork __softfp int _LocaleC_tolower(int)
_LocaleC_tolower:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        BL       _LocaleC_isupper
        CMP      R0,#+0
        BEQ.N    ??_LocaleC_tolower_0
        ADDS     R4,R4,#+32
        B.N      ??_LocaleC_tolower_1
??_LocaleC_tolower_0:
??_LocaleC_tolower_1:
        MOVS     R0,R4
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP isdigit
        THUMB
// __intrinsic __nounwind __interwork __softfp int isdigit(int)
isdigit:
        SUBS     R0,R0,#+48
        CMP      R0,#+10
        BCS.N    ??isdigit_0
        MOVS     R0,#+1
        B.N      ??isdigit_1
??isdigit_0:
        MOVS     R0,#+0
??isdigit_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:REORDER:NOROOT(1)
        SECTION_GROUP tolower
        THUMB
// __intrinsic __nounwind __interwork __softfp int tolower(int)
tolower:
        PUSH     {R7,LR}
        BL       _LocaleC_tolower
        POP      {R1,PC}          ;; return
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 PRINT_T PortToOut;
PortToOut:
        DS8 4
//    4 
//    5 #ifdef	TRUE
//    6 #define	TRUE	1
//    7 #endif
//    8 
//    9 #ifdef	FALSE
//   10 #define	FALSE	0
//   11 #endif
//   12 
//   13 #define	CR_as_CRLF	TRUE        //true������ʹ��"\n"��ʾ�س�������(CR/LF)
//   14                                 //false,Ҫʹ��"\n\r"��ʾ�س�������

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 static	int	do_padding;         //����Ҫ�������ַ�ʱ���øñ��
do_padding:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 static	int	left_flag;          //��������������ʱ���øñ��
left_flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 static	int	len;                //���水��ʽ������ַ����ĳ���
len:
        DS8 4
//   18 /******************************************************************************
//   19 ���㲻ָ����ȵ�ʱ�򣬳����Զ��������ݿ�Ĵ�С��
//   20 ���ƿ�ȡ�����������������Ҫ�����ʱ�򣬿���ʹ
//   21 ��ָ����ȵİ취������һ�㶼��ָ����ȵ�
//   22 ******************************************************************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 static	int	num1;               //�����ʽ���Ʒ��е�ǰ�����֣�
num1:
        DS8 4
//   24                                 //��������ֶο��

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 static	int	num2;               //�����ʽ���Ʒ��е������֣�
num2:
        DS8 4
//   26                                 //������ַ���ʱ��Ϊ
//   27                                 //����ַ�����
//   28 

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   29 static	char	pad_character;  //��������ַ�
pad_character:
        DS8 1
//   30 
//   31 /******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void Print_Init(PRINT_T *pPrint)
//   33 {
//   34 	PortToOut.m_printf =  pPrint->m_printf;
Print_Init:
        LDR.N    R1,??DataTable4
        LDR      R0,[R0, #+0]
        STR      R0,[R1, #+0]
//   35 }
        BX       LR               ;; return
//   36 /******************************************************************************/
//   37 /******************************************************************************
//   38 ���º����������ַ�:
//   39 ���������ʱʹ�������ʱ���������ұ��������ַ���
//   40 ���������ʱʹ���Ҷ���ʱ������������������ַ���
//   41 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   42 static	void	padding( const int l_flag)
//   43 {
padding:
        PUSH     {R4,LR}
//   44 	int	i;
//   45 
//   46     if(do_padding && l_flag && (len < num1))
        LDR.N    R1,??DataTable4_1
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BEQ.N    ??padding_0
        CMP      R0,#+0
        BEQ.N    ??padding_0
        LDR.N    R0,??DataTable4_2
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_3
        LDR      R1,[R1, #+0]
        CMP      R0,R1
        BGE.N    ??padding_0
//   47     {
//   48 		for(i = len; i < num1; i ++)
        LDR.N    R0,??DataTable4_2
        LDR      R4,[R0, #+0]
        B.N      ??padding_1
//   49         {
//   50 			PortToOut.m_printf(pad_character);
??padding_2:
        LDR.N    R0,??DataTable4_4
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+0]
        BLX      R1
//   51         }
        ADDS     R4,R4,#+1
??padding_1:
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        CMP      R4,R0
        BLT.N    ??padding_2
//   52     }
//   53 }
??padding_0:
        POP      {R4,PC}          ;; return
//   54 
//   55 /******************************************************************************
//   56 ���������do_padding,�������λ�ñ��l_flag,
//   57 ���ո�ʽ��ָ���ĸ�ʽ������˿�����ַ���������ַ�
//   58 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   59 static	void	outs(char *lp)
//   60 {
outs:
        PUSH     {R4,LR}
        MOVS     R4,R0
//   61 	len = strlen(lp);
        MOVS     R0,R4
        BL       strlen
        LDR.N    R1,??DataTable4_2
        STR      R0,[R1, #+0]
//   62 	padding(!left_flag);
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??outs_0
        MOVS     R0,#+1
        B.N      ??outs_1
??outs_0:
        MOVS     R0,#+0
??outs_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       padding
        B.N      ??outs_2
//   63 
//   64 	while (*lp && num2 --)
//   65 	{
//   66 		PortToOut.m_printf(*lp ++);
??outs_3:
        LDRB     R0,[R4, #+0]
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+0]
        BLX      R1
        ADDS     R4,R4,#+1
//   67 	}
??outs_2:
        LDRB     R0,[R4, #+0]
        CMP      R0,#+0
        BEQ.N    ??outs_4
        LDR.N    R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        SUBS     R1,R0,#+1
        LDR.N    R2,??DataTable4_6
        STR      R1,[R2, #+0]
        CMP      R0,#+0
        BNE.N    ??outs_3
//   68 	
//   69 	len = strlen(lp);
??outs_4:
        MOVS     R0,R4
        BL       strlen
        LDR.N    R1,??DataTable4_2
        STR      R0,[R1, #+0]
//   70 	padding(left_flag);
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        BL       padding
//   71 }
        POP      {R4,PC}          ;; return
//   72 
//   73 
//   74 /******************************************************************************
//   75 ���������do_padding,�������λ�ñ��l_flag,
//   76 ���ո�ʽ��ָ���ĸ�ʽ�����ơ����޷��š��ֶο�ȡ�
//   77 ���Ҷ���ȣ�������˿�����ַ���������ַ�
//   78 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   79 static void reoutnum(unsigned	long num, 
//   80 					 unsigned	int negative, 
//   81 					 const	long	base)
//   82 
//   83 {
reoutnum:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+52
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
//   84 	char	*cp;
//   85     char	outbuf[32];
//   86 	const	char	digits[] = "0123456789ABCDEF";
        ADD      R0,SP,#+0
        LDR.N    R1,??DataTable4_7
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
//   87 
//   88 	/*************************************************************
//   89 	����Ҫ��������ְ��ս���ת����ASCII�룬
//   90 	�Ե��򱣴���outbuf������
//   91 	*************************************************************/
//   92 	cp = outbuf;
        ADD      R4,SP,#+20
//   93 	do
//   94 		{
//   95 			*cp ++ = digits[(int)(num % base)];
??reoutnum_0:
        UDIV     R0,R5,R7
        MLS      R0,R7,R0,R5
        ADD      R1,SP,#+0
        LDRB     R0,[R0, R1]
        STRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
//   96 		}while((num /= base) != 0);
        UDIV     R5,R5,R7
        CMP      R5,#+0
        BNE.N    ??reoutnum_0
//   97 
//   98 	if(negative)
        CMP      R6,#+0
        BEQ.N    ??reoutnum_1
//   99 	{
//  100 		*cp ++ = '-';			//����Ǹ�����������β��Ӹ���
        MOVS     R0,#+45
        STRB     R0,[R4, #+0]
        ADDS     R4,R4,#+1
//  101 	}
//  102 
//  103 	*cp -- = 0;					//Ϊ��ʹ��strlen����������β�����\0
??reoutnum_1:
        MOVS     R0,#+0
        STRB     R0,[R4, #+0]
        SUBS     R4,R4,#+1
//  104 
//  105 	
//  106 	/************************************************************************
//  107 	����������ֵĶ��뷽ʽ�����ʵ��ط��������ַ�
//  108 	���ұ�����outbuf�е��ַ�
//  109 	*************************************************************************/
//  110 	len = strlen(outbuf);
        ADD      R0,SP,#+20
        BL       strlen
        LDR.N    R1,??DataTable4_2
        STR      R0,[R1, #+0]
//  111 	padding(!left_flag);
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??reoutnum_2
        MOVS     R0,#+1
        B.N      ??reoutnum_3
??reoutnum_2:
        MOVS     R0,#+0
??reoutnum_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       padding
        B.N      ??reoutnum_4
//  112 
//  113 	while(cp >= outbuf)
//  114 	{
//  115 		PortToOut.m_printf(*cp --);
??reoutnum_5:
        LDRB     R0,[R4, #+0]
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+0]
        BLX      R1
        SUBS     R4,R4,#+1
//  116 	}
??reoutnum_4:
        ADD      R0,SP,#+20
        CMP      R4,R0
        BCS.N    ??reoutnum_5
//  117 
//  118 	padding(left_flag);  
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        BL       padding
//  119 }
        ADD      SP,SP,#+52
        POP      {R4-R7,PC}       ;; return
//  120 
//  121 
//  122 /******************************************************************************
//  123 ��Ҫ�ȴ������λ��Ȼ�����reoutnum����
//  124 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  125 static	void	outnum(long num,
//  126 					   const long base, 
//  127 					   unsigned char sign)
//  128 {
outnum:
        PUSH     {R7,LR}
//  129 	unsigned	int	negative;
//  130 
//  131 	if((num < 0L) && sign)
        CMP      R0,#+0
        BPL.N    ??outnum_0
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??outnum_0
//  132 	{
//  133 		negative = 1;
        MOVS     R3,#+1
//  134 		num = - num;
        RSBS     R0,R0,#+0
        B.N      ??outnum_1
//  135 	}
//  136 	else negative = 0;
??outnum_0:
        MOVS     R3,#+0
//  137 
//  138 	reoutnum(num, negative, base);
??outnum_1:
        MOVS     R2,R1
        MOVS     R1,R3
        BL       reoutnum
//  139 }
        POP      {R0,PC}          ;; return
//  140 
//  141 
//  142 /******************************************************************************
//  143 �Ӹ�ʽ�ַ�����ȡ�����֣���Щ����������ʾ�ֶο�ȵȣ�
//  144 �����ҽ�������ASCII���������Ϊʮ�������֡�
//  145 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  146 static	int	getnum(char** linep)
//  147 {
getnum:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//  148 	int	n;
//  149 	char*	cp;
//  150 	
//  151 	n = 0;
        MOVS     R5,#+0
//  152 	cp = *linep;
        LDR      R6,[R4, #+0]
        B.N      ??getnum_0
//  153 	while(isdigit(*cp))
//  154 	{
//  155 		n = n * 10 + ((*cp ++) - '0');
??getnum_1:
        MOVS     R0,#+10
        LDRB     R1,[R6, #+0]
        MLA      R0,R0,R5,R1
        SUBS     R5,R0,#+48
        ADDS     R6,R6,#+1
//  156 	}
??getnum_0:
        LDRB     R0,[R6, #+0]
        BL       isdigit
        CMP      R0,#+0
        BNE.N    ??getnum_1
//  157 
//  158 	*linep = cp;
        STR      R6,[R4, #+0]
//  159 	return(n);
        MOVS     R0,R5
        POP      {R4-R6,PC}       ;; return
//  160 }
//  161 
//  162 
//  163 /******************************************************************************
//  164 ���ո�ʽ�ַ����ƶ���Ҫ����˿��������,
//  165 ����֧�����еı�׼C���ݸ�ʽ����ֻ֧��Ƕ��ʽϵͳ
//  166 �����õ��ĸ�ʽ,ʡ���˸������ݸ�ʽ��
//  167 �����Ѿ�֧�ֵĸ�ʽ����ĸ�ʽ���Ժ����׵ı����ӽ�ȥ��
//  168 ******************************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  169 void	printp(char* ctrl, ...)
//  170 {
printp:
        PUSH     {R0-R3}
        PUSH     {R3-R7,LR}
//  171 	int	long_flag;
//  172 	int	dot_flag;
//  173 
//  174 	char	ch;			
//  175 	va_list	argp;		//����Ϊ�ɱ������������Ҫ���в�����ȡ��
//  176 						//argp����ֻ����ɱ����
//  177 	va_start(argp, ctrl);
        ADD      R4,SP,#+28
        B.N      ??printp_0
//  178 						//��ʼ��argp,ʹ��ָ���һ���ɱ����
//  179 	/*******************************************************************
//  180 	ctrl�������ڶ�ջ�У���Ϊ������ʽ�ַ�����ָ�룬
//  181 	����ctrl��Ϊָ�������ʽ�ַ�����
//  182 	������Ǹ�ʽ���Ʊ��%���ͽ��������if�ṹ��
//  183 	���ַ������Ȼ����������ѭ����
//  184 	��ʼ�´�ѭ�����������һ���ַ���
//  185 	�����%������if���и�ʽ�ж����������
//  186 	********************************************************************/
//  187 	for( ; *ctrl; ctrl ++)
//  188 	{
//  189 		if (*ctrl != '%')
//  190 		{
//  191 		    PortToOut.m_printf(*ctrl);
??printp_1:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+0]
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+0]
        BLX      R1
//  192 #if CR_as_CRLF == TRUE
//  193 			if(*ctrl == '\n') PortToOut.m_printf('\r');
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??printp_2
        MOVS     R0,#+13
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+0]
        BLX      R1
//  194 #endif
//  195 			continue;
//  196 		}
??printp_2:
??printp_3:
        LDR      R0,[SP, #+24]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+24]
??printp_0:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.W    ??printp_4
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+0]
        CMP      R0,#+37
        BNE.N    ??printp_1
//  197 		/************************************************************
//  198 		��������ʽ���Ʊ��%ʱ������ִ������
//  199 		�Ĵ��룬�ȳ�ʼ�����еı����
//  200 		************************************************************/
//  201 		dot_flag = 
//  202 		long_flag =
//  203       	left_flag  =
//  204       	do_padding = 0;
        MOVS     R5,#+0
        LDR.N    R0,??DataTable4_1
        STR      R5,[R0, #+0]
        LDR.N    R0,??DataTable4_5
        STR      R5,[R0, #+0]
        MOVS     R6,R5
//  205       	pad_character = ' ';
        LDR.N    R0,??DataTable4_4
        MOVS     R1,#+32
        STRB     R1,[R0, #+0]
//  206 		num2 = 32767;
        LDR.N    R0,??DataTable4_6
        MOVW     R1,#+32767
        STR      R1,[R0, #+0]
        B.N      ??printp_5
//  207 
//  208 	try_next:
//  209 		ch = *( ++ctrl);	//ȡ�ø�ʽ���Ʊ��%�������֡��㡢
//  210 		                    //'-'����l������ַ�
//  211 
//  212 		if(isdigit(ch))		//�ж��Ƿ�Ϊ����
//  213 		{
//  214 			if(dot_flag)	//�ж��������ڵ�Ǯ�����ڵ��
//  215 			                //�����ڵ�ǰ�������ִ���
//  216 							//num1��������num2
//  217 			{
//  218 				num2 = getnum(&ctrl);
//  219 			}
//  220 			else
//  221 			{
//  222 				if(ch == '0')
??printp_6:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+48
        BNE.N    ??printp_7
//  223 				{
//  224 					pad_character = '0';
        LDR.N    R0,??DataTable4_4
        MOVS     R1,#+48
        STRB     R1,[R0, #+0]
//  225 				}
//  226 
//  227 				num1 = getnum(&ctrl);
??printp_7:
        ADD      R0,SP,#+24
        BL       getnum
        LDR.N    R1,??DataTable4_3
        STR      R0,[R1, #+0]
//  228 				do_padding = 1;
        LDR.N    R0,??DataTable4_1
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  229 			}
//  230 
//  231 			ctrl --;
??printp_8:
        LDR      R0,[SP, #+24]
        SUBS     R0,R0,#+1
        STR      R0,[SP, #+24]
//  232 			goto try_next;
??printp_5:
        LDR      R0,[SP, #+24]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+24]
        LDRB     R7,[R0, #+0]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        BL       isdigit
        CMP      R0,#+0
        BEQ.N    ??printp_9
        CMP      R6,#+0
        BEQ.N    ??printp_6
        ADD      R0,SP,#+24
        BL       getnum
        LDR.N    R1,??DataTable4_6
        STR      R0,[R1, #+0]
        B.N      ??printp_8
//  233 		}
//  234 
//  235 		switch(tolower(ch))	//�жϸ�ʽ�����ַ�������ָ����ʽ���
??printp_9:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R0,R7
        BL       tolower
        CMP      R0,#+37
        BEQ.N    ??printp_10
        CMP      R0,#+45
        BEQ.N    ??printp_11
        CMP      R0,#+46
        BEQ.N    ??printp_12
        CMP      R0,#+88
        BEQ.N    ??printp_13
        CMP      R0,#+99
        BEQ.N    ??printp_14
        CMP      R0,#+100
        BEQ.N    ??printp_15
        CMP      R0,#+108
        BEQ.N    ??printp_16
        CMP      R0,#+115
        BEQ.N    ??printp_17
        B.N      ??printp_18
//  236 		                    //���ݻ��߽�һ���ж������ʽ
//  237 		{
//  238 			case	'%':	PortToOut.m_printf('%');
??printp_10:
        MOVS     R0,#+37
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+0]
        BLX      R1
//  239 			continue;
        B.N      ??printp_3
//  240 			case	'-':	left_flag = 1;
??printp_11:
        LDR.N    R0,??DataTable4_5
        MOVS     R1,#+1
        STR      R1,[R0, #+0]
//  241 			break;
//  242 			case	'.':	dot_flag = 1;
//  243 			break;
//  244 			case	'l':	long_flag = 1;
//  245 			break;
//  246 			case	'd':	
//  247 				if ( long_flag == 1)
//  248 				{
//  249 					if( ch == 'D')		//�����Ρ��޷���
//  250 					{
//  251 						outnum(va_arg(argp, unsigned long), 10L, 0);
//  252 						continue;
//  253 					}
//  254 					else				//�����Ρ��з���
//  255 					{
//  256 						outnum(va_arg(argp, long), 10L, 1);
//  257 						continue;
//  258 					}
//  259 				}
//  260 				else
//  261 				{
//  262 					if( ch == 'D')		//���Ρ��޷���
//  263 					{
//  264 						outnum(va_arg(argp, unsigned int), 10L, 0);
//  265 						continue;
//  266 					}
//  267 					else				//���Ρ��з���
//  268 					{
//  269 						outnum(va_arg(argp, int), 10L, 1);
//  270 						continue;
//  271 					}
//  272 				}
//  273 			case	'X':	
//  274 				if ( long_flag == 1)
//  275 				{
//  276 					if ( ch == 'X')		//��16���ơ��޷���
//  277 					{
//  278 						outnum(va_arg(argp, unsigned long), 16L, 0);
//  279 						continue;
//  280 					}
//  281 					else				//��16���ơ��з���
//  282 					{
//  283 						outnum(va_arg(argp, long), 16L, 1);
//  284 						continue;
//  285 					}
//  286 				} 
//  287 				else
//  288 				{
//  289 					if ( ch == 'X')		//��16���ơ��޷���
//  290 					{
//  291 						outnum(va_arg(argp, unsigned int), 16L, 0);
//  292 						continue;
//  293 					} 
//  294 					else				//��16���ơ��з���
//  295 					{
//  296 						outnum(va_arg(argp,	int), 16L, 1);
//  297 						continue;
//  298 					}
//  299 				}
//  300 
//  301 			case	's':				//����ַ���
//  302 				outs(va_arg(argp, char*));
//  303 				continue;
//  304 
//  305 			case	'c':				//����ַ�
//  306 				PortToOut.m_printf(va_arg(argp , int));
//  307 				continue;
//  308 		
//  309 			default:
//  310 				continue;
//  311 		}
//  312 		goto	try_next;				//������ַ����Ƹ�ʽʱ��
??printp_19:
        B.N      ??printp_5
??printp_12:
        MOVS     R6,#+1
        B.N      ??printp_19
??printp_16:
        MOVS     R5,#+1
        B.N      ??printp_19
??printp_15:
        CMP      R5,#+1
        BNE.N    ??printp_20
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+68
        BNE.N    ??printp_21
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        MOVS     R2,#+0
        MOVS     R1,#+10
        LDR      R0,[R0, #+0]
        BL       outnum
        B.N      ??printp_3
??printp_21:
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        MOVS     R2,#+1
        MOVS     R1,#+10
        LDR      R0,[R0, #+0]
        BL       outnum
        B.N      ??printp_3
??printp_20:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+68
        BNE.N    ??printp_22
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        MOVS     R2,#+0
        MOVS     R1,#+10
        LDR      R0,[R0, #+0]
        BL       outnum
        B.N      ??printp_3
??printp_22:
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        MOVS     R2,#+1
        MOVS     R1,#+10
        LDR      R0,[R0, #+0]
        BL       outnum
        B.N      ??printp_3
??printp_13:
        CMP      R5,#+1
        BNE.N    ??printp_23
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+88
        BNE.N    ??printp_24
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        MOVS     R2,#+0
        MOVS     R1,#+16
        LDR      R0,[R0, #+0]
        BL       outnum
        B.N      ??printp_3
??printp_24:
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        MOVS     R2,#+1
        MOVS     R1,#+16
        LDR      R0,[R0, #+0]
        BL       outnum
        B.N      ??printp_3
??printp_23:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+88
        BNE.N    ??printp_25
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        MOVS     R2,#+0
        MOVS     R1,#+16
        LDR      R0,[R0, #+0]
        BL       outnum
        B.N      ??printp_3
??printp_25:
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        MOVS     R2,#+1
        MOVS     R1,#+16
        LDR      R0,[R0, #+0]
        BL       outnum
        B.N      ??printp_3
??printp_17:
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        LDR      R0,[R0, #+0]
        BL       outs
        B.N      ??printp_3
??printp_14:
        MOVS     R0,R4
        ADDS     R4,R0,#+4
        LDR      R0,[R0, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable4
        LDR      R1,[R1, #+0]
        BLX      R1
        B.N      ??printp_3
??printp_18:
        B.N      ??printp_3
//  313 		                                //��ִ�е�������
//  314 
//  315 	}				//forѭ������
//  316 
//  317 	va_end( argp);						//�����ɱ������ȡ
//  318 }
??printp_4:
        POP      {R0,R4-R7}
        LDR      PC,[SP], #+20    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     PortToOut

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     do_padding

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     len

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     num1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     pad_character

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     left_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     num2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     `?<Constant "0123456789ABCDEF">`

        SECTION `.iar_vfe_header`:DATA:REORDER:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
`?<Constant "0123456789ABCDEF">`:
        DATA
        DC8 "0123456789ABCDEF"
        DC8 0, 0, 0

        END
// 
//  25 bytes in section .bss
//  20 bytes in section .rodata
// 854 bytes in section .text
// 
// 792 bytes of CODE  memory (+ 62 bytes shared)
//  20 bytes of CONST memory
//  25 bytes of DATA  memory
//
//Errors: none
//Warnings: none
