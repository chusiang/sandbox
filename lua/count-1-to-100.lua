#!/usr/local/bin/lua
--  ============================================================
--   Author: chusiang / chusiang (at) drx.tw
--   Blog: http://note.drx.tw
--   Filename: count-1-to-100.lua
--   Modified: 2024-05-10 22:12
--   Description: count 1 to 100.
--  ===========================================================

-- Init.
local count = 0

-- Loop.
for number = 1, 101, 1 do
	count = count + number
end

print(count)
