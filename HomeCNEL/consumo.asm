.data 
.eqv len 20
label:.asciiz "Ingrese total actual de KW consumidos: "
label2: .asciiz "Ingrese consumo de Kw del mes anterior: " 
corregir: .asciiz "----Valores invertidos, vuelva a ingresar correctamente los valores----\n"
valorComercializacion: .double 1.41
texto: .space len
.text
.globl consumo 
consumo: 
    addi $sp,$sp,-4
    sw $ra,($sp)
    
    loop: 
    li $v0, 4
    la $a0, label 
    syscall 
    li $v0,5
    la $a0,texto
    li $a1,len
    syscall
    #guardando valor consumo actual $f4
    #mov.d $f4,$f0 #----------------------------------------------------
    move $s2, $v0  #se guarda el consumo actual 
    
    li $v0, 4
    la $a0, label2 
    syscall 
    li $v0,5
    la $a0,texto
    li $a1,len
    syscall
    #guardando valor consumo anterior $f6
    move $s3, $v0 
    bgt $s3, $s2, error    #verificamos si los datos son correctamente ingresados 
    #Obteniendo valor del consumo _---------------------
    sub $t2, $s2, $s3    #resta de los kw 
    
    #Convertir entero a float, el valor de t2 lo copiamos a f8
     mtc1.d $t2, $f8
     cvt.d.w $f8, $f8
         
    jal tarifaDig   #verificicando si cumple con tarifa de la dignidad 

    mul.d $f4,$f8,$f2   #podemos volver a usar $f4 por que no necesitamos guardarla  $f4 ahora es el valor de consumo no cambiar $f4   
    
    l.d $f10,valorComercializacion
    add.d $f12,$f4,$f10   #valor total precioComercializacion+consumo 
    jal terceraEdad     #llamamos a la funcion tercera edad 
    j salida 
    
    
 error: 
      li $v0,4
      la $a0,corregir
      syscall
      j  loop
      
salida:
  lw $ra,($sp)
  addi $sp,$sp,4
  jr $ra
   
