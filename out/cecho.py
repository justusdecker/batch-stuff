# Will be compiled later
from sys import argv
print("".join([f"\033[{arg[1:]}m" if arg[0] == ':' else arg for arg in argv[1:]]))