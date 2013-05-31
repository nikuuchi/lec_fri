#!/bin/bash

lex Ge2.l
yacc Ge2.y
gcc y.tab.c -ly -ll -o Ge2
