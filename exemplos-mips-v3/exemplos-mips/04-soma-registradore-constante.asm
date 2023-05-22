.data
	prompt_A: .asciiz "A = "
	resultado: .asciiz "A + 15 = "
	new_line:  .asciiz "\n"

.text

	la    $a0, prompt_A        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	li    $v0, 5      #Carregamento da funcao read_int
	syscall
	
	move  $s0, $v0   #Salva valor do inteiro em registrador
	addi  $s0, $s0, 15

	la    $a0, resultado        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao

	move $a0, $s0     #Carrega o argumento	
	li    $v0, 1      #Carrega a funcao de impressao de inteiro
	syscall
	
	la    $a0, new_line        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	li   $v0, 10          # system call for exit
	syscall               # Exit!
