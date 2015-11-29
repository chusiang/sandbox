#!/usr/bin/python
# -*- coding: utf8 -*-
# ============================================================
#  Author: 凍仁翔 / chusiang.lai (at) gmail.com
#  Blog: http://note.drx.tw
#  Filename: hello_pyinotify.py
#  Modified: 2015-11-29 23:55
#  Description: monitors transient files. 
#  Reference: 
#  
#   - monitors transient files.
#    - https://github.com/seb-m/pyinotify/blob/master/python2/examples/transient_file.py
#
# =========================================================== 

import pyinotify
import os

class ProcessTransientFile(pyinotify.ProcessEvent):

  def process_default(self, event):
    # Implicitely IN_CREATE and IN_DELETE are watched too. You can
    # ignore them and provide an empty process_default or you can
    # process them, either with process_default or their dedicated
    # method (process_IN_CREATE, process_IN_DELETE) which would
    # override process_default.
    print '(Pyinotify) ', event.maskname

  def process_IN_MODIFY(self, event):
    # We have explicitely registered for this kind of event.
    print event.pathname, 'has modified.'
    os.system("echo 'Hello Pyinotify!'")

def main():
  wm = pyinotify.WatchManager()
  notifier = pyinotify.Notifier(wm)
  # In this case you must give the class object (ProcessTransientFile)
  # as last parameter not a class instance.
  wm.watch_transient_file('/tmp/foo', pyinotify.IN_MODIFY, ProcessTransientFile)
  notifier.loop()

if __name__ == "__main__":
  main()

