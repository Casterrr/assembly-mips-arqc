#int minha_soma (int a, int b) {
#	return a + b;
#}
#
#int main() {
#	for(int i = 0; i < 10; i++) {
#		int resultado = soma(i, 2 * i)
#		printf("i = %d\n", resultado);
#	}
#		
#	return 0;
#}

.data
	new_line: .asciiz "\n"
	msg_soma: .asciiz "soma = "	
.text


main:
	
	li $s0, 0
	li $s1, 10
FOR_1:
	beq $s0, $s1, EXIT_FOR_1
	
	la $a0, msg_soma
	li $v0, 4
	syscall		
	
	#Salvando contexto na stack
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	#Contexto salvo
	
	add $s3, $s0, $s0
	move $a0, $s0
	move $a1, $s3
	
	jal soma
	
	#Recuperando contexto
	lw $s0, 0($sp) 
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	#contexto recuperado

	move $a0, $v0
	li $v0, 1
	syscall
	
	la $a0, new_line
	li $v0, 4
	syscall	
	
	addi $s0, $s0, 1
	j FOR_1
EXIT_FOR_1:	
	j SAIDA
	
soma: 
	add $t0, $a0, $a1
	move $v0, $t0  	
	jr $ra
	
SAIDA:	
	
	
	li   $v0, 10          # system call for exit
	syscall               # Exit!	
