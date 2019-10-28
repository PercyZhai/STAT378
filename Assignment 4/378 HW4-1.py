# -*- coding: utf-8 -*-
"""
STAT 37810
Homework 4
Problem 1
"Bull and Cow Game"
BY PERCY ZHAI
"""


import random

computer_choice = random.sample(range(10),4)

n_bull = 0
n_guess = 1

while n_bull != 4 and n_guess <= 10:

    # Initialization
    n_bull = 0
    n_cow = 0
    n_bullandcow = 0
    won = False
    
    # User input
    print("Guess "+ str(n_guess))
    user_choice = [int(i) for i in input("Input four numbers >> ").split()]
    
    # Calculate n_bull
    for i in range(4):
        if user_choice[i] == computer_choice[i]:
            n_bull += 1
            
    # Calculate n_bullandcow
    for i in range(10):
        n_user = 0
        n_comp = 0
        for j in range(4):
            if user_choice[j] == i:
                n_user += 1
            if computer_choice[j] == i:
                n_comp += 1
        if (n_user>0) & (n_comp>0) == True:
            n_bullandcow += 1
        
    # Output results and n_guess +1
    n_cow = n_bullandcow - n_bull
    print(str(n_bull)+" bulls and "+str(n_cow)+"cows.")
    n_guess += 1

if n_bull == 4:
    print("You win!")
    won = True
    
if (n_guess == 11) & (won == False):
    print("Already 10 times. You lose.")
    
                
                
    