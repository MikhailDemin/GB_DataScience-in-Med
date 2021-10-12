import random

array = [random.randint(-500, 500) for _ in range(200)]
print(array)

arr_negative = []
arr_positive = []

for item in array:
    if item < 0:
        arr_negative.append(item)
    else:
        arr_positive.append(item)

print(arr_positive)
print(arr_negative)
