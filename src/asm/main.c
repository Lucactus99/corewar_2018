/*
** EPITECH PROJECT, 2018
** corewar
** File description:
** The assembler entry point.
*/

#include <limits.h>
#include <stdlib.h>

#include "corewar.h"
#include "redcode.h"
#include "my_string.h"

static char *get_name(const char *base)
{
    char *end = my_strrchr(base, '.');
    size_t len = end - base;

    if (end == NULL)
        return (char *) base;
    if (end[1] == 's' && end[2] == '\0')
        return my_strndup(base, len);

    return (char *) base;
}

int main(int argc, char const *argv[])
{
    FILE *in = NULL;
    FILE *out = NULL;
    char *name = NULL;

    if (argc < 2 || (name = get_name(argv[1])) == NULL)
        return EXIT_ERROR;
    if ((in = fopen(name, "r")) == NULL)
        if ((in = fopen(str_join(name, '.', "s"), "r")) == NULL)
            return EXIT_ERROR;
    if ((out = fopen(str_join(name, '.', "cor"), "wb")) == NULL)
        return EXIT_ERROR;
    if (redcode_encode(in, out) < 0)
        return EXIT_ERROR;

    return EXIT_SUCCESS;
}
