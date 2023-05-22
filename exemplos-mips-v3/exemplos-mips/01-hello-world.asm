



.data
	boas_vindas: .asciiz "Olá mundo!\n"
.text

	la   $a0, boas_vindas        # load address of the print heading string
 	li   $v0, 4           # specify Print String service
	syscall               # print the heading string

	li   $v0, 10          # system call for exit
	syscall               # Exit!
