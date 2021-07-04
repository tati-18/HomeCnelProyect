.data 
.eqv len 20
enunciado: .asciiz "**HOME-CNEL**\n"
enunciado3: .asciiz "Su total es: "
enunciadoUltimo: .asciiz "\nDesea volver a calcular\n Inserte: (1) Si  (0) No\n Ingrese valor: "
gracias: .asciiz "GRACIAS POR USAR NUESTRO SISTEMA"
enumErr: .asciiz "-----------Valores incorrectos---------\n"
texto: .space len
.text
.globl HomeCnel

HomeCnel:

  li $v0, 4
  la $a0, enunciado
  syscall
  
  jal sector  #Hacemos la llamada a sector
  jal consumo  #hacemos la llamda a consumo 
  li $v0, 4
  la $a0, enunciado3
  syscall
  li $v0, 3
  syscall
  repeticion:  #si la persona quiere volver a ingresar 
   li $v0, 4
   la $a0, enunciadoUltimo
   syscall
   li $v0,5
   la $a0,texto
   li $a1,len
   syscall
   move $s1,$v0   
   addi $t3, $zero, 1  
   bgt  $s1,$t3,error   #vereficamos que los valores sean correctamente ingresados 
   addi $t1,$zero, 1
   beq $t1,$s1,HomeCnel 
   li $v0, 4
   la $a0, gracias
   syscall
   j salida 

   
    
  
  
 error: 
  li $v0,4
  la $a0,enumErr
    syscall 
  li $v0,4
  la $a0,enunciadoUltimo
   syscall 
   j repeticion 
  
 salida:
  li $v0,10
  syscall

   
   
     
 
    
  
 
