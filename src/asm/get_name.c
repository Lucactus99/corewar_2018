/*
** EPITECH PROJECT, 2018
** corewar
** File description:
** Get input file name (omit extension).
*/

#include "corewar.h"
#include "my_string.h"

char *get_name(const char *base)
{
    char *end = my_strrchr(base, '.');
    size_t len = end - base;

    if (end == NULL)
        return (char *) base;
    if (end[1] == 's' && end[2] == '\0')
        return my_strndup(base, len);

    return (char *) base;
}
