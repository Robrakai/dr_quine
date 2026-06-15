CC      = gcc
CFLAGS  = -Wall -Wextra

NAME    = Grace

all: $(NAME)

$(NAME): $(NAME).c
	$(CC) $(CFLAGS) -o $(NAME) $(NAME).c

diff: $(NAME)
	./$(NAME)
	diff $(NAME).c $(NAME)_kid.c

clean:
	rm -f $(NAME)
	rm -f $(NAME)_kid.c


re: clean all

.PHONY: all diff clean re
