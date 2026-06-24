CC      = gcc
ASM     = nasm
PIE		= -no-pie
SFLAGS  = -f elf64

NAME    = Sully

all: $(NAME)

$(NAME): $(NAME).s
	$(ASM) $(SFLAGS) $(NAME).s -o $(NAME).o && $(CC) $(NAME).o -o $(NAME) $(PIE)

diff: $(NAME)
	./$(NAME)
	diff $(NAME)_3.s $(NAME)_2.s

clean:
	rm -f $(NAME).o
	rm -f $(NAME)
	rm -f $(NAME)_0.c
	rm -f $(NAME)_0
	rm -f $(NAME)_1.c
	rm -f $(NAME)_1
	rm -f $(NAME)_2.c
	rm -f $(NAME)_2
	rm -f $(NAME)_3.c
	rm -f $(NAME)_3
	rm -f $(NAME)_4.c
	rm -f $(NAME)_4
	rm -f $(NAME)_5.c
	rm -f $(NAME)_5


re: clean all

.PHONY: all diff clean re


# nasm -f elf64 Colleen.s -o Colleen.o && gcc Colleen.o -o Colleen -no-pie
# nasm -f elf64 Grace.s -o Grace.o && gcc -nostartfiles Grace.o -o Grace -no-pie
