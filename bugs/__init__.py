#!/usr/bin/python3
# -*- coding: utf-8 -*-

from math import floor, ceil

# (c) Severogor

def bugs(b, s, verbose=False):
    """
    Calculate free right and left fields by bits shift
    b : "bugs" number
    s : "stones" number
    verbose : verbose output

    returns : [ left , right ] free "stones"
    """

    # check input interval for bugs: [1, stones number]
    if b < 1 or b > s:
        raise ValueError

    # get the nearest following power of 2
    i, p = b, 1
    while i > 1:
        i >>= 1
        p += 1
    i <<= p

    # approximate fields
    v = (s - b) / i
    fv = floor(v)

    # integer fields
    fields = [fv, [fv, ceil(v)][(v - fv) >= 0.5]]

    if verbose:
        print("b=%s %s i=%s %s\t%s\tp=%s\tfv=%s\tv-fv=%s" % (b, bin(b), i, bin(i), fields, p, fv, v - fv))

    return fields


