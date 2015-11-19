#!/usr/bin/python
# -*- coding: utf8 -*-
# ============================================================
#  Author: 凍仁翔 / chusiang.lai (at) gmail.com
#  Blog: http://note.drx.tw
#  Filename: hello_pytest.py
#  Modified: 2015-06-05 15:36
#  Description: Unittest lab witn Pytest. We need do install the 'pytest' package, first.
#
#   # Run pytest.
#   $ py.test hello_pytest.py
#
#  Reference: 
#  
#   1. Basic test configuration
#    - https://pytest.org/latest/customize.html
#
# =========================================================== 

import pytest

def hello(name):
    message = 'hello ' + name
    return message

def test_hello():
    assert hello('jonny') == 'hello jonny' 

def main():
  try:
      result = hello('jonny')
      print result

  except:
      # ...
      pass

if __name__ == "__main__":
  main()
