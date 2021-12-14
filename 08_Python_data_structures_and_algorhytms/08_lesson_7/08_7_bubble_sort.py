import random

size = 10
array = [i for i in range(size)]
random.shuffle(array)
print(array)


n = 1
while n < len(array):
    for i in range(len(array) - n):
        if array[i] > array[i + 1]:
            array[i], array[i + 1] = array[i + 1], array[i]
    n += 1
    print(array)


print(array)

# классическая реализация сортировки пузырьком
# for i in range(len(lst) - 1, 0, -1)
#     for j in range(i):
#         if lst[j] > lst[j + 1]:
#             lst[j], lst[j + 1] = lst[j + 1], lst[j]


# def bubble_sort(array):
#     k = 0
#     n = len(array)
#     while True:
#         c = 0
#         for i in range(n - k - 1):
#             j = n - i - 1
#             if array[j] < array[j - 1]:
#                 array[j], array[j - 1] = array[j - 1], array[j]
#                 c += 1
#         if c == 0:
#             break
