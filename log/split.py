#!/usr/bin/python3

import fileinput
import sys
import os
from tqdm import tqdm

f = sys.stdout
num_format = '%05d'

def mangle(fname):
	for c in ('/', ':', '\\'):
		fname = fname.replace(c, '_')
	return fname

def getnext(fname):
	lastfname = fname + '.last'
	try:
		last = int(open(lastfname, 'r').read())
		next_ = last + 1
	except:
		next_ = 0
	global num_format
	open(lastfname, 'w').write(num_format % next_)
	return next_

def chfile(fname):
	fname = mangle(fname)
	if not os.path.exists(fname):
		os.mkdir(fname)
	i = getnext(fname)
	global f
	global num_format
	f = open(os.path.join(fname, num_format % i), 'w')

for line in tqdm(fileinput.input()):
	if line[:2] == '+ ':
		chfile(line[2:].strip())
		continue
	f.write(line)
