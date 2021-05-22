#!/usr/bin/python3

import cgi
import subprocess

# Header
print("content-type: text/html")
print()

# Retrieving the value of the variables from the webserver
data = cgi.FieldStorage()
x_var = data.getvalue("x")
#y_var = mydata.getvalue("y")

# Printing the output of the command
cmd= subprocess.getoutput("sudo " + x_var)
print(cmd)

