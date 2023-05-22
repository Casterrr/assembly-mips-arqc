.data
	prompt_A: .asciiz "1 - Fahrenheit - > Celsius\n2 - Fibonnacci\n3 - Enesimo par\n4 - Sair\n \n"
	prompt_B: .asciiz "B = "	
	resultado: .asciiz "A + B = "
	new_line:  .asciiz "\n"



.text

	la    $a0, prompt_A        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	li    $v0, 5      #Carregamento da funcao read_int
	syscall
	
	# move  $s0, $v0   #Salva valor do inteiro em registrador

	# la    $a0, prompt_B        # Carregamento do argumento
 	# li    $v0, 4           # Definicao da funcao print 
	# syscall               # Chamada da funcao
	
	# li    $v0, 5      #Carregamento da funcao read_int
	# syscall
	
	# move  $s1, $v0   #Salva valor do inteiro em registrador

	
	# add $s2, $s1, $s0
	
	# la    $a0, resultado        # Carregamento do argumento
 	# li    $v0, 4           # Definicao da funcao print 
	# syscall               # Chamada da funcao

	# move $a0, $s2     #Carrega o argumento	
	# li    $v0, 1      #Carrega a funcao de impressao de inteiro
	# syscall
	
	# la    $a0, new_line        # Carregamento do argumento
 	# li    $v0, 4           # Definicao da funcao print 
	# syscall               # Chamada da funcao
	
	# li   $v0, 10          # system call for exit
	# syscall               # Exit!
