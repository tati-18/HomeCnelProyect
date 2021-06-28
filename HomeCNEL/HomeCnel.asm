.data 
.eqv len 20
enunciado: .asciiz "**HOME-CNEL**\n"
label:.asciiz "Ingrese total actual de KW consumidos: "
label2: .asciiz "Ingrese consumo de Kw del mes anterior: " 
corregir: .asciiz "----Valores invertidos, vuelva a ingresar correctamente los valores----\n"
valorComercializacion: .double 1.41

enunciado3: .asciiz "Su total es: "
texto: .space len
.text
.globl HomeCnel

HomeCnel:
  li $v0, 4
  la $a0, enunciado
  syscall
  
  jal sector
  
  calcularConsumo: 
    li $v0, 4
    la $a0, label 
    syscall 
    li $v0,7
    la $a0,texto
    li $a1,len
    syscall
    #guardando valor consumo actual $f4
    mov.d $f4,$f0 #----------------------------------------------------
    move $s2, $v0  #se guarda el consumo actual 
    
    li $v0, 4
    la $a0, label2 
    syscall 
    li $v0,7
    la $a0,texto
    li $a1,len
    syscall
    #guardando valor consumo anterior $f6
    mov.d $f6,$f0 #-------------------------------------------
    move $s3, $v0 #se guarda el consumo anterior 
    
    #Obteniendo valor del consumo _---------------------
    sub $s2, $s2, $s3    #resta de los kw 
    sub.d $f8, $f4,$f6  
    
    jal tarifaDig   #verificicando si cumple con tarifa de la dignidad 

    mul.d $f4,$f8,$f2   #podemos volver a usar $f4 por que no necesitamos guardarla  $f4 ahora es el valor de consumo no cambiar $f4   
    
    l.d $f10,valorComercializacion
    add.d $f12,$f4,$f10   #valor total precioComercializacion+consumo 
    
    jal terceraEdad
   
   
 
 salida:
  li $v0, 3
  syscall
  li $v0,10
  syscall
   
   
     
 
    
  
 
