#!/usr/bin/python3

import cgi
import subprocess
import json

print("context-type: text/html")
print()

form = cgi.FieldStorage()

x_var = form.getvalue('x')

status, output = subprocess.getstatusoutput("sudo " + x_var)

db = {"output": output, "status": status}

final = json.dumps(db)

print(final)
