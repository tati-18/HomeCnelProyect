.data

valorDesc: .double 0.04 #descuento por kw/h
enunciado: .asciiz "Usted aplica para el descuento de la tarifa de la dignidad\n"
enunciado2: .ascii "Usted no cumple para el descuento de la tarifa de la dignidad\n" 

.text
.globl tarifaDig
tarifaDig: 
    addi $sp,$sp,-4
    sw $ra,($sp)
    addi $t0,$zero,12
    ble $s0,$t0,tarifaCosta
    addi $t0, $zero 110     #este valor es de la sierra
    ble  $s2, $t0, descuento
    li $v0,4
    la $a0,enunciado2
    syscall
    j salida 
   
  

tarifaCosta: 
   addi $t0, $zero, 130  #valor costa 
   ble   $s2, $t0, descuento
   li $v0,4
   la $a0,enunciado2
   syscall
   j salida
    
    
descuento: 
  li $v0,4
  la $a0,enunciado
  syscall
  l.d $f4, valorDesc
  sub.d  $f2, $f2, $f4
  j salida 
 

salida: 
  lw $ra,($sp)
  addi $sp,$sp,4
  jr $ra

  
