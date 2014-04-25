#!/usr/bin/python
# -*- coding: utf8 -*-

# 初始變數
movies = [
    'a', 1991, 'c', 2001, 'd', 2010, 'e', 2014, 'g', 2020,
     ['h', 11, 'i', 12,
      ['j', 21, 'k', 22]]]

# 宣告遞迴函數
def print_lol(the_list):
  for each_item in the_list:
    if (isinstance(each_item, list)):
      print_lol(each_item)
    else:
      print(each_item)

# 印出初始變數
print('movies = ' + str(movies) + '\n')

# 印出結果
print('result: \n')
print_lol(movies)
