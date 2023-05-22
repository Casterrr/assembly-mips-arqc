.data

.text
	li $s1, 2
	li $t0, 4

	mul $t0, $s1, $t0 #obtem o indice correto
	
	move $a0, $t0
	li    $v0, 1
	syscall