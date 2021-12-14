import random

size = 10
array = [i for i in range(size)]
random.shuffle(array)
print(array)


# def revers(array):
#     for i in range(len(array) // 2):
#         array[i], array[len(array) - i - 1] = array[len(array) - i - 1], array[i]
#
#
# revers(array)
# print(array)

# array.reverse()
# print(array)
#
# array.sort(reverse=True)
# print(array)

print('*' * 100)
t = tuple(random.randint(0, 100) for _ in range(size))
print(t)

# t.sort()
t = tuple(sorted(t))
print(t)

t = tuple(sorted(t, reverse=True))
print(t)