#!/bin/bash

lex _.l
yacc _.y
gcc y.tab.c -ly -ll -o _
