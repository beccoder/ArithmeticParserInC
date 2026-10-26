CC = gcc

calc: calc.c
	$(CC) -O2 -Wall -Wextra -std=c17 -o calc calc.c -lm

asan: calc.c
	$(CC) -O1 -g -Wall -Wextra -std=c17 -fsanitize=address,undefined -o calc calc.c -lm

test: calc
	sh calc-tests/run_tests.sh ./calc
	sh calc-tests/cli.sh ./calc

clean:
	rm -f calc

.PHONY: asan test clean
