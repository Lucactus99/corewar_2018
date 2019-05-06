##
## EPITECH PROJECT, 2018
## corewar
## File description:
## The program build instructions.
##

CC = gcc
CFLAGS = -Wall -Wextra -Iinclude -O2 -g
LDFLAGS = -Llib/libmy -Llib/liblist -Llib/libredcode
LDLIBS = -lmy -llist -lredcode

VM_NAME = corewar
VM_SRCS = $(wildcard src/vm/*.c) $(wildcard src/vm/**/*.c)
VM_OBJS = $(VM_SRCS:.c=.o)

ASM_NAME = asm
ASM_SRCS = $(wildcard src/asm/*.c) $(wildcard src/asm/**/*.c)
ASM_OBJS = $(ASM_SRCS:.c=.o)

all: $(ASM_NAME) $(VM_NAME)

$(ASM_NAME): lib/libmy/libmy.a lib/liblist/liblist.a lib/libredcode/libredcode.a
$(ASM_NAME): $(ASM_OBJS)
	$(CC) $(CFLAGS) -o $@ $(ASM_OBJS) $(LDFLAGS) $(LDLIBS)

$(VM_NAME): lib/libmy/libmy.a lib/liblist/liblist.a lib/libredcode/libredcode.a
$(VM_NAME): $(VM_OBJS)
	$(CC) $(CFLAGS) -o $@ $(VM_OBJS) $(LDFLAGS) $(LDLIBS)

clean:
	$(RM) src/*.o src/**/*.o src/**/**/*.o
	$(RM) src/*.gc* src/**/*.gc* src/**/**/*.gc*

fclean: clean
	$(RM) $(ASM_NAME) $(VM_NAME)

re: fclean all

.PHONY: all clean fclean re
