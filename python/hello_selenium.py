#!/usr/bin/python
# -*- coding: utf8 -*-

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from time import sleep

# 使用 Firefox 作為 webdriver。
driver = webdriver.Firefox()

# 前往 Google 首頁。
driver.get("https://www.google.com.tw")
sleep(2)

# 驗證 <title> </title> 裡的文字是否為 Google。
assert "Google" in driver.title

# 定義 Google 首頁搜尋框的元素名為 element。
element_searchbox = driver.find_element_by_name("q")

# 於搜尋框輸入文字
element_searchbox.send_keys("Selenium basic")
sleep(2)

element_searchbox.send_keys(" with Python", Keys.ARROW_LEFT)  # 除輸入文字後並按下 <左方向鍵>。
sleep(2)

# 取得搜尋框內容。
print("Result 1st: " + element_searchbox.get_attribute("value"))

# 清除搜尋框內容。
element_searchbox.clear()
sleep(2)

element_searchbox.send_keys("Hello Selenium !")
print("Result 2nd: " + element_searchbox.get_attribute("value"))

# 於搜尋框按下 <Enter>。
element_searchbox.send_keys(Keys.RETURN)

