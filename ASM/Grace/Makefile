CC      = gcc
ASM     = nasm
PIE		= -no-pie
SFLAGS  = -f elf64
CFLAGS	= -nostartfiles

NAME    = Grace

all: $(NAME)

$(NAME): $(NAME).s
	$(ASM) $(SFLAGS) $(NAME).s -o $(NAME).o && $(CC) $(CFLAGS) $(NAME).o -o $(NAME) $(PIE)

diff: $(NAME)
	./$(NAME)
	diff $(NAME)_kid.s $(NAME).s

clean:
	rm -f $(NAME)
	rm -f $(NAME).o
	rm -f $(NAME)_kid.s


re: clean all

.PHONY: all diff clean re


# nasm -f elf64 Colleen.s -o Colleen.o && gcc Colleen.o -o Colleen -no-pie
# nasm -f elf64 Grace.s -o Grace.o && gcc -nostartfiles Grace.o -o Grace -no-pie
