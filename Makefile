##
## EPITECH PROJECT, 2018
## corewar
## File description:
## The program build instructions.
##

CC = gcc
CFLAGS = -Wall -Wextra -Iinclude -O2 -pedantic -g
CFLAGS += -Wshadow -Wno-unused-parameter -Wpointer-arith
LDFLAGS = -Llib/libmy -Llib/liblist -Llib/libredcode
LDLIBS = -lmy -llist -lredcode

ASM_NAME = asm/asm
ASM_SRCS = $(wildcard src/asm/*.c) $(wildcard src/asm/**/*.c)
ASM_OBJS = $(ASM_SRCS:.c=.o)

VM_NAME = corewar/corewar
VM_SRCS = $(wildcard src/vm/*.c) $(wildcard src/vm/**/*.c)
VM_OBJS = $(VM_SRCS:.c=.o)

all: $(ASM_NAME) $(VM_NAME)

lib/libmy/libmy.a:
	$(MAKE) -C lib/libmy

lib/liblist/liblist.a:
	$(MAKE) -C lib/liblist

lib/libredcode/libredcode.a:
	$(MAKE) -C lib/libredcode

$(ASM_NAME): lib/libmy/libmy.a lib/liblist/liblist.a lib/libredcode/libredcode.a
$(ASM_NAME): $(ASM_OBJS)
	$(CC) $(CFLAGS) -o $@ $(ASM_OBJS) $(LDFLAGS) $(LDLIBS)

$(VM_NAME): lib/libmy/libmy.a lib/liblist/liblist.a lib/libredcode/libredcode.a
$(VM_NAME): $(VM_OBJS)
	$(CC) $(CFLAGS) -o $@ $(VM_OBJS) $(LDFLAGS) $(LDLIBS)

clean:
	$(MAKE) -C lib/libmy $@
	$(MAKE) -C lib/liblist $@
	$(MAKE) -C lib/libredcode $@
	$(RM) src/*.o src/**/*.o src/**/**/*.o
	$(RM) src/*.gc* src/**/*.gc* src/**/**/*.gc*

fclean: clean
	$(MAKE) -C lib/libmy $@
	$(MAKE) -C lib/liblist $@
	$(MAKE) -C lib/libredcode $@
	$(RM) $(ASM_NAME) $(VM_NAME)

re: fclean all

.PHONY: all clean fclean re
