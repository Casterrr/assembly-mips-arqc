#Le dois valores da tela e indica se sao iguais
.data
	prompt_A: .asciiz "A = "
	prompt_B: .asciiz "B = "	
	resultado_positivo: .asciiz "A > B"
	resultado_negativo: .asciiz "B < A"	
	new_line:  .asciiz "\n"

.text

	la    $a0, prompt_A        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	li    $v0, 5      #Carregamento da funcao read_int
	syscall
	
	move  $s0, $v0   #Salva valor do inteiro em registrador

	la    $a0, prompt_B        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	li    $v0, 5      #Carregamento da funcao read_int
	syscall
	
	move  $s1, $v0   #Salva valor do inteiro em registrador


	slt $s3, $s0, $s1   #$s0 < $s1
	slt $s4, $s0, $s1   #$s0 < $s1	
	or $s0, $s3, $s4

	
	
	move    $a0, $s0        # Carregamento do argumento
 	li    $v0, 1          # Definicao da funcao print_int 
	syscall               # Chamada da funcao
	
	li   $v0, 10          # system call for exit
	syscall               # Exit!
