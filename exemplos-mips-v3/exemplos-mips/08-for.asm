#for(int i = 0; i < 10; i++) {
#    printf(i)
#}
.data
	prompt_I: .asciiz "I = "
	prompt_i: .asciiz "i = "
	new_line:  .asciiz "\n"

.text

	la    $a0, prompt_I       # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	li    $v0, 5      #Carregamento da funcao read_int
	syscall
	
	move  $s0, $zero
	move  $s1, $v0   #Salva valor do inteiro em registrador
	
	la    $a0, new_line       # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
FOR: 
	beq $s0, $s1, SAIDA
	la    $a0, prompt_i       # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	move $a0, $s0     #Carrega o argumento	
	li    $v0, 1      #Carrega a funcao de impressao de inteiro
	syscall	
	
	la    $a0, new_line       # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao		
	
	addi $s0, $s0, 1
	j FOR
	
SAIDA:	
	li   $v0, 10          # system call for exit
	syscall               # Exit!
