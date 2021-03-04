import numpy as np

x = (10,10,10)
y = (0,0,-10)

print(np.sqrt(sum(tuple(map(lambda i, j: (i + j)**2, x, y)))))