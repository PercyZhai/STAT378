#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
STAT 37810
Homework 4
Problem 3
"Palindromic Number"
BY PERCY ZHAI
"""

def Ispalindromic(number):
    string = str(number)
    for i in range(len(string)):
        if string[i] != string[-1-i]:
            return False
    return True

TargetNumber = 0
TarNum1 = 0
TarNum2 = 0
for num1 in range(100,1000):
    for num2 in range(100,1000):
        prod = num1 * num2
        if (Ispalindromic(prod) == True) & (prod > TargetNumber):
            TargetNumber = prod
            TarNum1 = num1
            TarNum2 = num2
print("The largest palindromic number is "+str(TargetNumber)+" = "+str(TarNum1)+" * "+str(TarNum2))

