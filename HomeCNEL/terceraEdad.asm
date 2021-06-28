.data
.eqv len 10
descuento3raedad: .double 2.00
laber3raEd: .ascii "El cliente es de la tercera edad? (1) Si - (0) No\n "
texto: .space len
.text
.globl terceraEdad

terceraEdad: 
    addi $sp,$sp,-4
    sw $ra,($sp)
    
    li $v0, 4
    la $a0, laber3raEd
    syscall 
    li $v0,7
    la $a0,texto
    li $a1,len
    syscall
    
    move $s1,$v0 
    addi $t1,$zero, 1
    beq $s1, $t1 descTercera  
     j salida
     
descTercera: 
   l.d $f14, descuento3raedad
   sub.d $f12, $f12,$f14
   j salida
   
salida: 
  lw $ra,($sp)
  addi $sp,$sp,4
  jr $ra