# Will be compiled later
from sys import argv
print("".join([f"\033[{arg[1:]}m" if ':' in arg else arg for arg in argv[1:]]))