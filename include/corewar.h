/*
** EPITECH PROJECT, 2018
** corewar
** File description:
** The program main header.
*/

#ifndef COREWAR_H
#define COREWAR_H

#include <stddef.h>
#include <stdint.h>

#include "corewar/vm.h"
#include "corewar/asm.h"

#define EXIT_ERROR (84)

char *get_name(const char *base);
char *str_join(const char *a, char sep, const char *b);

#endif
