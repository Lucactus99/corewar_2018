/*
** EPITECH PROJECT, 2018
** libmy
** File description:
** Allocate memory and copy the given string in it.
*/

#include "my_stdlib.h"
#include "my_string.h"

char *my_strdup(const char *src)
{
    char *str = MY_NULL;

    if ((str = my_malloc(my_strlen(src) + 1)) == MY_NULL)
        return MY_NULL;

    return my_strcpy(str, src);
}
