#!/bin/sh
# ============================================================
#  Author: 凍仁翔 / chusiang.lai (at) gmail.com
#  Blog: http://note.drx.tw
#  Filename: hello-dialog.sh
#  Modified: 2015-05-14 05:20
#  Description: Dialog on GNU/Linux.
#  Reference: 
# =========================================================== 

MESSAGE="Hello Dialog !"

zenity --help > /dev/null
if [ 0 = $? ]; then
  zenity --info --text="$MESSAGE"
else
  dialog --no-shadow --infobox "$MESSAGE" 3 20
fi
