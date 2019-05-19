from subprocess import check_output, Popen
import re

# Utils
urlre = re.compile(
        r'^(?:http|ftp)s?://'  # http:// or https://
        r'(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|'  # domain...
        r'localhost|'  # localhost...
        r'\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})'  # ...or ip
        r'(?::\d+)?'  # optional port
        r'(?:/?|[/?]\S+)$', re.IGNORECASE)

geditre = re.compile(r'.* \((.+)\)')
termre = re.compile(r'.*: (.+)')
atomre = re.compile(r'.+ — (.+) — Atom')

# Get informations
current_window = check_output(['xdotool', 'getactivewindow', 'getwindowname'])\
                 .decode('utf-8')
current_selection = check_output(['xsel']).decode('utf-8')

# Let the magic do the job
# 1. Open any url in firefox
if urlre.match(current_selection):
    Popen(['firefox', current_selection])
else:
    # 2. Try to determine a path
    if 'gedit' in current_window:
        pwd = geditre.match(current_window)[1]
        Popen(['atom', pwd + current_selection])
    elif 'Atom' in current_window:
        pwd = atomre.match(current_window)[1]
        if pwd[-1] != '/':
            pwd += '/'
        Popen(['atom', pwd + current_selection])
    else:
        # Try with the last info
        pwd = current_window.split(' ')[-1]
        if pwd[-1] == '\n':
            pwd = pwd[:-1]
        if pwd[-1] != '/':
            pwd += '/'
        Popen(['atom', pwd + current_selection])
