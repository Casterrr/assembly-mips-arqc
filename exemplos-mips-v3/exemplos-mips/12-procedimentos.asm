#void minha funcao() {
#	printf("Mensagem exibida na funcao");
#}

#int main() {
#	printf("Ola mundo\n");
#	minha_funcao();
#	printf("Mensagem de saída do main"\n);
#	return 0;
#}

.data
	msg_funcao: .asciiz "Mensagem exibida na funcao"
	msg_main: .asciiz "Ola mundo"	
	msg_main2: .asciiz "Mensagem de saída do main"
	new_line: .asciiz "\n"
.text

main:
	la    $a0, msg_main        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	la    $a0, new_line        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	jal minha_funcao #Chama a funcao e cria um link no registrador $ra
	

	la    $a0, msg_main2        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
	
	la    $a0, new_line        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
		
	j SAIDA

minha_funcao:
	la    $a0, msg_funcao        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao

	la    $a0, new_line        # Carregamento do argumento
 	li    $v0, 4           # Definicao da funcao print 
	syscall               # Chamada da funcao
		
	jr $ra
	
SAIDA:	
	
	
	li   $v0, 10          # system call for exit
	syscall               # Exit!	
