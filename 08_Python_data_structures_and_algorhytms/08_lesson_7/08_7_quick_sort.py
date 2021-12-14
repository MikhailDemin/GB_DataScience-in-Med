import random

size = 10
array = [i for i in range(size)]
random.shuffle(array)
print(array)


# def hoar_quick_sort(array):
#
#     if len(array) <= 1:
#         return array
#
#     pivot = random.choice(array)
#     s_ar = []
#     m_ar = []
#     l_ar = []
#
#     for item in array:
#         if item < pivot:
#             s_ar.append(item)
#         elif item > pivot:
#             l_ar.append(item)
#         elif item == pivot:
#             m_ar.append(item)
#         else:
#             raise Exception('Unexpected happened')
#     print(s_ar, m_ar, l_ar)
#     return hoar_quick_sort(s_ar) + m_ar + hoar_quick_sort(l_ar)
#
#
# array_new = hoar_quick_sort(array)
# print(array_new)

def quick_sort_no_memory(array, fst, lst):

    if fst >= lst:
        return

    print(array)

    pivot = array[random.randint(fst, lst)]
    i, j = fst, lst

    while i <= j:

        while array[i] < pivot:
            i += 1

        while array[j] > pivot:
            j -= 1

        if i <= j:
            array[i], array[j] = array[j], array[i]
            i, j = i + 1, j - 1

    quick_sort_no_memory(array, fst, j)
    quick_sort_no_memory(array, i, lst)


quick_sort_no_memory(array, 0, len(array) - 1)
print(array)