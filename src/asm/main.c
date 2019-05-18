/*
** EPITECH PROJECT, 2018
** corewar
** File description:
** The assembler entry point.
*/

#include <stdlib.h>

#include "corewar.h"
#include "redcode.h"

static FILE *get_input(const char *name)
{
    FILE *in = NULL;

    if ((in = fopen(name, "r")) == NULL)
        if ((in = fopen(str_join(name, '.', "s"), "r")) == NULL)
            return NULL;

    return in;
}

int main(int argc, char const *argv[])
{
    FILE *in = NULL;
    char *name = NULL;
    parser_t *rc = NULL;
    const char *msg = NULL;

    if (argc < 2 || (name = get_name(argv[1])) == NULL)
        return EXIT_ERROR;
    if ((in = get_input(name)) == NULL)
        return EXIT_ERROR;
    if ((rc = redcode_parse(in)) == NULL || redcode_check(rc, &msg) < 0) {
        if (msg != NULL)
            my_puts(msg);

        return EXIT_ERROR;
    }
    if (redcode_setoutput(rc, fopen(str_join(name, '.', "cor"), "wb")) < 0)
        return EXIT_ERROR;
    if (redcode_encode(rc) < 0 || fclose(rc->out) < 0 || fclose(rc->in) < 0)
        return EXIT_ERROR;
    return EXIT_SUCCESS;
}
