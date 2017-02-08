#!/bin/bash
# ============================================================
#  Author: chusiang / chusiang (at) drx.tw
#  Blog: http://note.drx.tw
#  Filename: count-1-to-100.sh
#  Modified: 2017-02-08 11:06
#  Description: count 1 to 100.
#  Reference: 
#
#   - HowTo: Unix For Loop 1 to 100 Numbers
#    - https://www.cyberciti.biz/faq/unix-for-loop-1-to-10/
#
# =========================================================== 

# Init.
COUNT=0

# Loop.
for NUMBER in {1..100}; do
  let COUNT+=$NUMBER
done

# Print result.
echo $COUNT

