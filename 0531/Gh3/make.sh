#!/bin/bash

lex Gh3.l
yacc Gh3.y
gcc y.tab.c -ly -ll -o Gh3
