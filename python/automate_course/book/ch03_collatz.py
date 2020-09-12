#!/usr/bin/env python3
# -*- coding: utf-8 -*-

__author__ = "Chu-Siang Lai"
__maintainer__ = "Chu-Siang Lai"
__email__ = "chusiang.lai (at) gmail.com"
__date__ = "2020-09-13 01:20"
__status__ = "Prototype"
__contact__ = "The Collatz homework of Ch03."


"""
# Collatz 序列

設計一個名為 collatz() 的函式，且有一個傳入的 number 參數。如果 number 是偶數，
那 collatz() 就印出 number // 2，並返回該數值。如果 number 是奇數，collatz()
印出及返回 3 * number + 1。

接著編寫程式，讓使用者輸入一個整數，然後使用迴圈呼叫 collatz()，直到函式返回值是
1 才結束。

> 很神奇的是，這個序列對任何整數都有效，利用這個序列遲早會得出 1，即使數學家也不
> 確定為什麼，這個程式所探討就是著名的考拉茲猜想序列 (Collatz sequence)，有時被
> 稱為「最簡單、最不可能的數學問題」。

記住要把 input() 取得的返迴值先轉換成整數型別，鎮然它還是字串。

> HINT:
>
> 如果 number % 2 == 0，number 整數就是偶數；如果 number % 2 == 1，那它就是奇數。
"""


def collatz(number):
    _divided_num = number % 2
    if _divided_num == 0:
        _num = number // 2
    elif _divided_num == 1:
        _num = 3 * number + 1
    else:
        print("Ooops ..")
    return _num


try:
    print("==> Please input one integer: ")
    int_num = int(input())
    result = collatz(int_num)
    print(result)

except ValueError:
    print("===> ERROR: Please input the integer !")

except NameError:
    print("===> ERRPR: Please input the integer !")
