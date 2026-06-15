CC      = gcc
CFLAGS  = -Wall -Wextra

NAME    = Sully

all: $(NAME)

$(NAME): $(NAME).c
	$(CC) $(CFLAGS) -o $(NAME) $(NAME).c

diff: $(NAME)
	./$(NAME) > tmp_$(NAME)
	diff tmp_$(NAME) $(NAME).c
	rm -f tmp_$(NAME)

clean:
	rm -f $(NAME)
	rm -f tmp_$(NAME)


re: clean all

.PHONY: all diff clean re
