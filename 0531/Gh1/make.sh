#!/bin/bash

lex Gh1.l
yacc Gh1.y
gcc y.tab.c -ly -ll -o Gh1
