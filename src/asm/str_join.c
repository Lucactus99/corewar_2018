/*
** EPITECH PROJECT, 2018
** corewar
** File description:
** Join two paths together.
*/

#include <limits.h>

#include "my_string.h"

char *str_join(const char *a, char sep, const char *b)
{
    static char path[PATH_MAX + 1];

    my_strcpy(path, a);
    my_strcat(path, (char []) {sep, '\0'});
    my_strcat(path, b);

    return path;
}
