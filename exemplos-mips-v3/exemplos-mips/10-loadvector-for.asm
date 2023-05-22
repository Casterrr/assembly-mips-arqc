##include <stdio.h>
##include <stdlib.h>
##include <locale.h>
#int main(){
#    int c[15] = {3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0};
#    for(int i = 0; i < 15; i++)
#       printf("%d \n", a);
#}

.data
	c: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0
	new_line: .asciiz "\n"


.text
	la $s0, c #Carrega o endereco de c
	li $s1, 0 #inicio do contador
	li $s2, 16 #tamanho máximo do vetor
	
	
FOR:
	beq $s1, $s2, SAIDA
	li $t0, 4

	mul $t0, $t0, $s1 #obtem o indice correto
	
#	lw $s3, $t0($s0) #não é possivel usar o valor de um registrador como indice. 
	add $t0, $t0, $s0
	lw $s3, 0($t0)	
	
	move $a0, $s3
	li    $v0, 1
	syscall
	
	la $a0, new_line
	li $v0, 4
	syscall	
	
	addi $s1, $s1, 1
	j FOR
SAIDA:	
	
	
	li   $v0, 10          # system call for exit
	syscall               # Exit!
