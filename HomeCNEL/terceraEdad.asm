.data
.eqv len 10
descuento3raedad: .double 2.00
laber3raEd: .asciiz "El cliente es de la tercera edad? (1) Si - (0) No \n Ingrese valor:  "
enunciadoErr: .asciiz  "Valor incorrecto \n "

texto: .space len
.text
.globl terceraEdad

terceraEdad: 
    addi $sp,$sp,-4
    sw $ra,($sp)
    loop: 
     li $v0, 4
     la $a0, laber3raEd
     syscall 
     li $v0,5
     la $a0,texto
     li $a1,len
     syscall
     move $s1,$v0  
     
     addi $t3, $zero, 1 
     bgt  $s1,$t3,error   #vereficamos que los valores sean correctamente ingresados 
     addi $t1,$zero, 1
     beq $s1, $t1, descTercera  #se comprueba si es tercera edad  de ser asi entra a la funcion de descuento 
       j salida
     
descTercera: 
   l.d $f14, descuento3raedad
   sub.d $f12, $f12,$f14
   j salida
   
error: 
  li $v0,4
  la $a0,enunciadoErr
    syscall 
  li $v0,4
  la $a0,laber3raEd 
    syscall 
  j loop
  
    
salida: 
  lw $ra,($sp)
  addi $sp,$sp,4
  jr $ra
