#! /usr/bin/env python

import sys

L = sys.stdin.readlines()
print '{:}'.format(sum(map(int, L))/len(L))
