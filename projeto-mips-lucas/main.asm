.data
  menu: .asciiz "1 - Fahrenheit - > Celsius\n2 - Fibonnacci\n3 - Enesimo par\n4 - Sair\n \n"

.text
  ## Cria um "laço de repetição". Aqui, poderia ser qualquer nome, mas para criar semelhança as outras linguagens,
  ## será adotado o nome while
  while:
    ## Todo o código dentro desse módulo será repetido infinitamente, até o usuário escolher a opção 4
    
    
    jal quebraLinha # Chama a função que quebrará a linha
    
    ## Neste trecho, será mostrado o menu de opções definido na variável menu
    la    $a0, menu         # Aqui o valor definido em menu é carregado no registrador $a0
    jal imprimeTexto        # chamando a função que vai imprimir um texto
            
            
    ## Neste trecho, será lida e salva a escolha do usuário
    jal leInteiro           # chamando a função que vai ler um inteiro
    move $s0, $v0	    # Salvando a escolha do usuário no registrador $s0
    
    
    ## Neste trecho, a depender da escolha do usuário, será executada uma função diferente
    beq   $s0, 1, fahrenheit_celcius       # Se for escolhido 1, chama a função que converte fahrenheit para célcius                                  
    beq   $s0, 2, fibonacci                # Se for escolhido 2, chama a função que mostra o enésimo termo de fibonacci
    beq   $s0, 3, enesimo_par                # Se for escolhido 3, chama a função que mostra o enésimo termo número par
    beq   $s0, 4, finalizar_programa       # Se for escolhido 4, chama a função que vai encerrar o programa

                                    
    j while # executa o módulo while de novo
    
    
  ## Criando a função que vai finalizar o programa  
  finalizar_programa:
    ## Nessa função o programa será encerrado
    li $v0, 10               # Aqui atribuímos o valor 10 para $v0
    syscall		     # e ao chamar o syscall com $v0 = 10, o programa é finalizado.
    
    jr $ra
  
  ## Criando a função que vai imprimir textos
  imprimeTexto:
    ## Essa função imprimirá o texto armazenado no registrador $a0
    li    $v0, 4            # Nessa linha o valor 4 é atribuído ao registrador $v0
    syscall                 # e aqui a função syscall é chamada, ela olhará o valor de $v0 e executará uma ação
                            # Nesse caso, como o valor é 4, será chamada a função print_string, 
                            # que exibirá em tela o valor armazenado no registrador $a0
                            
    jr $ra   # Retornará o valor da função aonde ela foi chamada
    
  ## Criando a função que vai imprimir inteiros
  imprimeInteiro:
    ## Essa função imprimirá o inteiro armazenado no registrador $a0
    li    $v0, 1            # Nessa linha o valor 1 é atribuído ao registrador $v0
    syscall                 # e aqui a função syscall é chamada, ela olhará o valor de $v0 e executará uma ação
                            # Nesse caso, como o valor é 1, será chamada a função print_int, 
                            # que exibirá em tela o valor armazenado no registrador $a0
                            
    jr $ra   # Retornará o valor da função aonde ela foi chamada
    
  ## Criando a função que vai ler inteiros
  leInteiro:
    ## Essa função lerá um inteiro informado pelo usuário
    li    $v0, 5            # Nessa linha o valor 5 é atribuído ao registrador $v0
    syscall                 # e aqui a função syscall é chamada, ela olhará o valor de $v0 e executará uma ação
                            # Nesse caso, como o valor é 5, será chamada a função read_int, 
                            # que esperará que usuário digite um número inteiro
                            
    jr $ra   # Retornará o valor da função aonde ela foi chamada
  
  
  quebraLinha: 
    li $a0, '\n'
    li $v0, 11
    syscall

    jr $ra  # Retornará o valor da função aonde ela foi chamada
  
  
  
  
  
  ## Criando a função que vai converter o valor informado de célcius para fahrenheit
  fahrenheit_celcius:
    ## Nessa função será feita a conversão de fahrenheit para célcius
    ## A fórmula utilizada é: Celsius = (Fahrenheit - 32) * 5/9.

    ## Lê a temperatura em Fahrenheit do usuário
    jal leInteiro
    move $s0, $v0  # Salva a temperatura em Fahrenheit em $s0

    ## Aplicando a fórmula para converter o valor em Fahrenheit para Célcius
    li $s1, 32         # Atribui o valor 32 ao registrador $s1
    sub $s0, $s0, $s1  # Subtrai 32 do valor em Fahrenheit que está em $s1, e salva em $s0
    li $s1, 5          # Atribui o valor 5 ao registrador $s1
    mult $s0, $s1      # Múltiplica o valor em $s0 por 5
    mflo $s0           # Salva a parte inteira do resultado da multiplicação em $s0
    li $s1, 9          # Atribui o valor 9 para o registrador $s1
    div $s0, $s1       # Divide o valor em $s0 por 9
    mflo $s0           # Salva a parte inteira do resultado da divisão em $s0

    # A temperatura em Celsius está em $s0
    
    move $a0, $s0
    jal imprimeInteiro
    
    jal quebraLinha

    j while
  
  
  
  
  
  ## Criando a função para calcular o enésimo termo da sequência de Fibonacci
  fibonacci:
    ## Nessa função, será calculado o enésimo termo da sequência de fibonacci, a partir de um valor inserido 
    ## pelo usuário. 
    ## O cálculo será feito salvando os dois termos anteriores em registradores diferentes, um representando
    ## o último termo, e o outro representando o penúltimo termo.
  
  
    # Primeiro, será pego o enésimo termo a partir do usuário
    jal leInteiro
    move $s0, $v0  # Coloca o enésimo termo no registrador $s0
    
    
    # Inicialmente, os registradores $s1 e $s2 armazenaram os primeiros termos da sequência
    li $s1, 0  # Primeiro termo da sequência de fibonacci
    li $s2, 1  # Segundo termo da sequência de fibonacci


    # Se o enésimo termo for o primeiro ou o segundo termo, pulará o loop e irá direto para o código final
    beq $s0, 0, fim_fibonacci  # Se o enésimo termo for 0, ir direto pro final
    beq $s0, 1, fim_fibonacci  # Se o enésimo termo for 1, ir direto pro final


    # Como os dois primeiros termos já foram definidos, é preciso reduzir 2 do número de vezes que o loop
    # irá se repetir, ou seja, diminuir 2 do contador, que nesse caso é o enésimo termo informado pelo usuário
    # que está no registrado $s0
    addi $s0, $s0, -2  # Decrementar o enésimo termo em 2 (ele serve de contador para o loop)
    loop_fibonacci:
        add $s3, $s1, $s2  # Soma os dois termos anteriores e salva o resultado no registrado $s3
        move $s1, $s2  # O penúltimo termo passa a ser o último atual
        move $s2, $s3  # O último termo passa a ser a soma dos dois termos anteiores
        addi $s0, $s0, -1  # Decrementa o enésimo termo em 1 (lembrando, ele serve de contador aqui)
        bgtz $s0, loop_fibonacci  # Se o enésimo termo for maior que 0, repete o loop
  
  ## Criando a função que finalizará a sequência de fibonacci
  fim_fibonacci:
    # O enésimo termo  está em $s2
    move $a0, $s2
    jal imprimeInteiro
    
    jal quebraLinha
    
    j while



  ## Criando a função que irá calcular o enésimo número par
  enesimo_par:
    ## Nessa função é calculado o enésimo número par a partir de um valor informado pelo usuário
    
    ## Pega enésimo termo do usuário
    jal leInteiro
    move $s0, $v0  # Salva o valor do enésimo termo em $s0

    # Para pegar o enésimo número par, basta multiplicar a sua posição por 2
    li $s1, 2    # Atribui o valor 2 ao registrador $s1
    mult $s0, $s1   # Multiplica o enésimo termo por 2
    mflo $s0    # Salva o resultado da multiplicação em $s0

    # O enésimo número par está em $s0
    move $a0, $s0
    jal imprimeInteiro
    
    jal quebraLinha
    
    j while