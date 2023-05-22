.data
	prompt_float: .asciiz "Digite um float: "
	resultado: .asciiz "Valor lido = "
	new_line:  .asciiz "\n"

.text

	la    $a0, prompt_float        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	li    $v0, 6      #Carregamento da funcao read_float
	syscall
	
	la    $a0, resultado        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao

		
        mov.s $f12, $f0
	li    $v0, 2      #Carrega a funcao de impressao de inteiro
	syscall
	
	la    $a0, new_line        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	li   $v0, 10          # system call for exit
	syscall               # Exit!
