#!/usr/bin/env python3

x = int(input("-> "))

G = 39

for i in range(G + 1):
    print(f"{x}^{i} = {x**i % G}")
