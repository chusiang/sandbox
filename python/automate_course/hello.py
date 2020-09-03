#!/usr/bin/env python3

__author__ = "Al Sweigart"
__maintainer__ = "Chu-Siang Lai"
__email__ = "chusiang.lai (at) gmail.com"
__date__ = "2020-09-03 23:50"
__status__ = "Prototype"
__contact__ = "This program says hello and asks for my name."


print('Hello, Python !')

print('What is your name?')     # ask for ther name.
myName = input()
print('It is good to meet you, ' + myName)
print('The length of your name is:')
print(len(myName))

print('What is you age?')       # ask for ther age.
myAge = input()
print('You will be ' + str(int(myAge) + 1) + ' in a year.')
