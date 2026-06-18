CC      = gcc
CFLAGS  = -Wall -Wextra

NAME    = Sully

all: $(NAME)

$(NAME): $(NAME).c
	$(CC) $(CFLAGS) -o $(NAME) $(NAME).c

diff1: $(NAME)
	./$(NAME)
	diff $(NAME).c $(NAME)_0.c

diff2: $(NAME)
	./$(NAME)
	diff $(NAME)_3.c $(NAME)_2.c

clean:
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

.PHONY: all diff1 diff2 clean re
