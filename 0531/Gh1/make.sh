#!/bin/bash

lex "${1}.l"
yacc "${1}.y"
gcc y.tab.c -ly -ll -o $1
