.section __TEXT,__text

.global start

start:
  movl $0x2000004, %eax           # Preparing syscall 4
  movl $1, %edi                   # stdout file descriptor = 1
  movq str@GOTPCREL(%rip), %rsi   # The string to print
  movq $100, %rdx                 # The size of the value to print
  syscall

  movl $0, %ebx
  movl $0x2000001, %eax           # exit 0
  syscall

.section __DATA,__data
str:
  .asciz "Hello World!\n"