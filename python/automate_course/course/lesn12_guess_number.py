#!/usr/bin/env python3
# This is a guess the number game.
#
# > https://www.udemy.com/course/automate/learn/lecture/3465826#content

import random

print('Hello. What is you name?')
name = input()

print('Well, ' + name + ', I am thinking of a number between 1 and 20.')
secretNumber = random.randint(1, 20)

# Ask the player to guess 6 time.
for guessesTaken in range(1, 7):
    print('Take a guess.')
    guess = int(input())
    if guess < secretNumber:
        print('Your guess is too low.')
    elif guess > secretNumber:
        print('Your guess is too high.')
    else:
        break  # This condition is the correct guess!

if guess == secretNumber:
    print(
            'Good job, ' + name + '! You guesses my number in '
            + str(guessesTaken) + ' guesses!')
else:
    print('Nope. The number I was thinging of was ' + str(guessesTaken) + '.')
