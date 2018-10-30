#!/usr/bin/python3
# -*- coding: utf-8 -*-

from sys import argv
from bugs import bugs


try:
    ns = int(argv[1])

except IndexError:
    print("""
  Usage:

    %s [stones:int] [bugs:int]
    """ % (argv[0],))
    exit()

try:
    nb = int(argv[2])

except IndexError:
    nb = ns


print("\nStones: %s, bugs: %s" % (ns, nb))

print(bugs(nb, ns), "\n")


