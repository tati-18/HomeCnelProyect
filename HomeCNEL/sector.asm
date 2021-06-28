.data 
.eqv len 20
esmeralda: .double 0.0969   #1
elOro: .double  0.1017   #2
manabi: .double 0.093      #3
staElena: .double 0.1061   #4
guayas: .double 0.1031    #5
guayaquil: .double 0.0948 #6
losRios: .double 0.094    #7
milagro: .double 0.1025  #8
galapagos: .double 0.1087  #9
zamora: .double 0.1089   #10
sucumbios: .double 0.102   #11
moronaSantigo: .double 0.01039 #12
stoDomingo: .double  0.1056  #13
azogues:.double 0.0994      #14
cotopaxi: .double 0.1026   #15
ambato: .double  0.1014    #16
quito: .double 0.0951    #17
riobamba: .double 0.1068   #18
bolivar: .double 0.0997    #19
imaburaCar: .double 0.1047 #20
enunciado: .asciiz "Los codigos de los sectores son:\n"
enunciado1: .asciiz "  (1)Esmeralda - (2)El Oro - (3)Manabi - (4)Santa Elena - (5)Guayas - (6)Guayaquil - (7)Los Rios\n"
enunciado1.1: .asciiz "   (8)Milagro - (7)Los Rios - (9)Galapagos - (10)Zamora - (11)Sucumbios - (12)Morona Santiago\n"
enunciado1.2: .asciiz "   (13)Santo Domingo - (14)Azogues- (15)Cotopaxi - (16)Ambato - (17)Quito - (18)Riobamba - (19)Bolivar - (20)Imabura-Carchi\n"
enunciado2: .asciiz "El nombre de su sector lo encontrara en su planilla electrica\n"
enunciado3: .asciiz "Ingrese el numero correspondiente a su sector: "
enunciadoError: .asciiz "--------------Codigo incorrecto-----------\n"
texto: .space len
.text
.globl sector
sector:
    addi $sp,$sp,-4
    sw $ra,($sp)
    while:
      li $v0,4
      la $a0,enunciado
      syscall
      la $a0,enunciado1
      syscall 
      la $a0,enunciado1.1
      syscall
      la $a0,enunciado1.2
      syscall
      la $a0,enunciado2
      syscall
      la $a0,enunciado3
      syscall
      li $v0,5
      la $a0,texto
      li $a1,len
      syscall
      move $s0,$v0 
      addi $t0,$zero,1
      beq $s0,$t0,recEsmeraldas
      addi $t0,$zero,2
      beq $s0,$t0,recelOro
      addi $t0,$zero,3
      beq $s0,$t0,recManabi 
      addi $t0,$zero,4
      beq $s0,$t0,recSElena
      addi $t0,$zero,5
      beq $s0,$t0,recGuayas
      addi $t0,$zero,6
      beq $s0,$t0,recGuayaquil
      addi $t0,$zero,7
      beq $s0,$t0,reclosRios
      addi $t0,$zero,8
      beq $s0,$t0,recMilagro
      addi $t0,$zero,9
      beq $s0,$t0,recGalapagos
      addi $t0,$zero,10
      beq $s0,$t0, recZamora
      addi $t0,$zero,11
      beq $s0,$t0,recSucumbios
      addi $t0,$zero,12
      beq $s0,$t0,recMorona
      addi $t0,$zero,13
      beq $s0,$t0,recSntDomingo 
      addi $t0,$zero,14
      beq $s0,$t0,recAzoguez
      addi $t0,$zero,15
      beq $s0,$t0,recCotopaxi
      addi $t0,$zero,16
      beq $s0,$t0,recAmbato 
      addi $t0,$zero,17
      beq $s0,$t0,recQuito
      addi $t0,$zero,18
      beq $s0,$t0, recRiobamba
      addi $t0,$zero,19
      beq $s0,$t0, recBolivar
      addi $t0,$zero,20
      beq $s0,$t0, recImbaburaCa
      
      li $v0,4
      la $a0,enunciadoError
      syscall
      j while
    
    
    #s0 contendra el numero ingresado de la provincia
recEsmeraldas:
   l.d $f2,esmeralda
   j salida

recSntDomingo:
   l.d $f2, stoDomingo
   j salida
     
recManabi:
   l.d $f2, manabi
   j salida
     
recSElena:
   l.d $f2, staElena
   j salida
     
recGuayas:
   l.d $f2,guayas
   j salida
     
recGuayaquil:
   l.d $f2,guayaquil
   j salida
     
reclosRios:
   l.d $f2,losRios
   j salida
     
recMilagro:
   l.d $f2,milagro 
   j salida 
    
 recelOro: 
   l.d $f2,elOro 
   j salida
     
recQuito: 
   l.d $f2,quito 
   j salida
     
recCotopaxi: 
   l.d $f2,cotopaxi
   j salida
      
recBolivar: 
  l.d $f2,bolivar
  j salida
     
recRiobamba: 
  l.d $f2,riobamba
  j salida
     
 recAzoguez: 
   l.d $f2,azogues
   j salida
     
recSucumbios:
       l.d $f2,sucumbios
       j salida
     
recAmbato: 
  l.d $f2,ambato 
  j salida
    
recGalapagos: 
  l.d $f2,galapagos
  j salida
     
 recZamora: 
  l.d $f2,zamora
  j salida

recMorona: 
  l.d $f2,moronaSantigo
  j salida

recImbaburaCa: 
  l.d $f2,moronaSantigo
  j salida
    
salida:
  lw $ra,($sp)
  addi $sp,$sp,4
  jr $ra
 

   
   
    
    
    
    
    
  
     
   
     
     


