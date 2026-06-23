CC      = gcc
ASM     = nasm
PIE		= -no-pie
CFLAGS  = -f elf64

NAME    = Colleen

all: $(NAME)

$(NAME): $(NAME).s
	$(ASM) $(CFLAGS) $(NAME).s -o $(NAME).o && $(CC) $(NAME).o -o $(NAME) $(PIE)

diff: $(NAME)
	./$(NAME) > test
	diff test $(NAME).s
	rm -f test

clean:
	rm -f $(NAME)
	rm -f $(NAME).o
	rm -f test


re: clean all

.PHONY: all diff clean re
