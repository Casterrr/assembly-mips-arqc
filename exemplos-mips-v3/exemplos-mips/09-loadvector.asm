##include <stdio.h>
##include <stdlib.h>
##include <locale.h>
#int main(){
#    int c[15] = {3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0};
#    int a = 0, b = 30;
#    a = b + c[0];
#    printf("\n o valor de a é: %d \n", a);
#}

.data
	c: .word 3, 0, 1, 2, -6, -2, 4, 10, 3, 7, 8, -9, -15, -20, -87, 0


.text
	li $s0, 0  #Carrega 'a'
	li $s1, 30  #Carrega 'b'	
	la $s2, c #Carrega o endereco de c
	
	lw $t0, 8($s2)  #indice cresce de 4 em 4 por conta do tamanho do word
	add $s0, $s1, $t0

	move $a0, $s0
	
	
 	li    $v0, 1           # specify Print String service
	syscall               # print the heading string
	
	
	
	li   $v0, 10          # system call for exit
	syscall               # Exit!
