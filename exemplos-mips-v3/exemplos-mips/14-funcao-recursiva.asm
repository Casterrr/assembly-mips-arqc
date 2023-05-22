#int fat(int f) {
#	if(f == 1)
#		return f
#	else
#		return f * fat(f - 1);
#}

#int main() {
#	int r =  fat(5)
#	printf("fatorial = %d\n", r);
#	return 0;
#}

.data
	new_line: .asciiz "\n"
	msg_res: .asciiz "fatorial = "	
.text


main:
	
	li $a0, 5
	jal fat
	
	move $s0, $v0
	
	la $a0, msg_res
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall
	
	la $a0, new_line
	li $v0, 4
	syscall
	
	j SAIDA
	
fat: 

	
	addi $t0, $zero, 1
	bne $a0, $t0 ELSE
IF:
	move $v0, $a0
	j EXIT_FAT

ELSE:

	#Salvando contexto na stack
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	#Contexto salvo
	addi $a0, $a0, -1
	jal fat
	

	#Recuperando contexto
	lw $ra, 0($sp) 
	lw $a0, 4($sp)
	addi $sp, $sp, 8
	#contexto recuperado
	
	mul $v0, $v0, $a0
	
EXIT_FAT:
	jr $ra
	

	
SAIDA:	
	
	
	li   $v0, 10          # system call for exit
	syscall               # Exit!	
