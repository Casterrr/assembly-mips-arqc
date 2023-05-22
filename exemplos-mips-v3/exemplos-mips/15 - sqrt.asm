.data
	prompt: .asciiz "Digite um valor: "
	new_line: .asciiz "\n"
	res1: .asciiz "O valor lido é: "
	res2: .asciiz "A raiz quadrada é: "
.text
	la $a0, prompt
	li $v0, 4
	syscall
	
	li $v0, 6
	syscall
	
	mov.s $f1, $f0
	sqrt.s $f2, $f1
	
	la $a0, res1
	li $v0, 4
	syscall
	
	li $v0, 2
	mov.s $f12, $f1
	syscall	
	
	
	
	la $a0, new_line
	li $v0, 4
	syscall
	
	la $a0, res2
	li $v0, 4
	syscall
	
	li $v0, 2
	mov.s $f12, $f2
	syscall	
	
	la $a0, new_line
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall		
		
	
	
