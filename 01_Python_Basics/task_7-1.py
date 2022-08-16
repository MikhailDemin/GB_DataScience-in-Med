# 1)    Реализовать класс Matrix(матрица).Обеспечить перегрузку конструктора класса(метод __init__()), который должен
# принимать данные(список списков) для формирования матрицы.
# Подсказка: матрица — система некоторых математических величин, расположенных в виде прямоугольной схемы.
#     Примеры матриц: 3 на 2, 3 на 3, 2 на 4.
# 31 22       3    5    32        3 5 8 3
# 37 43       2    4     6        8 3 7 1
# 51 86       -1  64   -8
# Следующий шаг — реализовать перегрузку метода __str__() для вывода матрицы в привычном виде.
# Далее реализовать перегрузку метода __add__() для реализации операции сложения двух объектов класса Matrix(двух
# матриц). Результатом сложения должна быть новая матрица.
# Подсказка: сложение элементов матриц выполнять поэлементно — первый элемент первой строки первой матрицы складываем с
# первым элементом первой строки второй матрицы и т.д.
# my solution ####
a = [[3, 6, 8], [5, 10, 7]]
b = [[2, 6, 5], [8, 12, 4]]


class Matrix:
    def __init__(self, matrix):
        self.matrix = matrix

    def __add__(self, other):
        d = []
        for i in range(len(self.matrix)):
            d.append([])
            for j in range(len(self.matrix[0])):
                d[i].append(self.matrix[i][j] + other.matrix[i][j])
        return '\n'.join(map(str, d))

    def __str__(self):
        return '\n'.join(map(str, self.matrix))


matrix_1 = Matrix(a)
matrix_2 = Matrix(b)
print(f'Matrix 1\n{matrix_1}\n{"-" * 20}')
print(f'Matrix 2\n{matrix_2}\n{"-" * 20}')
#  ------------------------------------------- вариант решения ---------------------------------------------------------


class Matrix:
    def __init__(self, data):
        self.data = data

    def __str__(self):
        return '\n'.join('\t'.join([str(itm) for itm in line]) for line in self.data)

    def __add__(self, other):
        try:
            m = [[int(self.data[line][itm]) + int(other.data[line][itm]) for itm in range(len(self.data[line]))]
                 for line in range(len(self.data))]
            return Matrix(m)
        except IndexError:
            return f'Ошибка размерностей матриц'


m_1 = [[3, 5, 32], [2, 4, 6], [-1, 64, -8]]
m_2 = [['5', '7', '23'], ['9', '23', '-54'], ['12', '3', '16']]

mtrx_1 = Matrix(m_1)
mtrx_2 = Matrix(m_2)
new_m = mtrx_1 + mtrx_2

print(mtrx_1)
print('#' * 30)
print(mtrx_2)
print('#' * 30)
print(mtrx_1 + mtrx_2)
print('#' * 30)
print(new_m)
m_3 = [[3, 5, 32], [2, 4, 6], [-1, 64, -8]]
m_4 = [['5', '7', '23'], ['9', '-54'], ['12', '3', '16']]
print('#' * 30)
mtrx_3 = Matrix(m_3)
mtrx_4 = Matrix(m_4)
print(mtrx_3 + mtrx_4)
print('#' * 30)
m_3 = [[3, 5, 32], [2, 4, 6], [-1, 64, -8]]
m_4 = [['5', '7', '23'], ['12', '3', '16'], ['12', '3']]
print(mtrx_3 + mtrx_4)
#  ------------------------------------------- вариант решения ---------------------------------------------------------


class Matrix(object):
    def __init__(self, matrix):
        self.matrix = matrix

    def __str__(self):
        return str('\n '.join(['\t '.join([str(i) for i in j]) for j in self.matrix]))

    def __add__(self, other):
        return Matrix([map(sum, zip(*t)) for t in zip(self.matrix, other.matrix)])


stroki = int(input("Введите количество строк и столбцов матрицы: "))
stolbci = stroki

matrix1 = Matrix([[i * j for j in range(stroki)] for i in range(stolbci)])
matrix2 = Matrix([[i + j for j in range(stroki)] for i in range(stolbci)])

print('First matrix:\n', matrix1, end='\n\n')
print('Second matrix:\n', matrix2, end='\n\n')
print('Summ of first and second matrix:\n', matrix1 + matrix2)

#  ------------------------------------------- вариант решения ---------------------------------------------------------


class Matrix:

    def __init__(self, matrix):
        self.matrix = matrix

    def __str__(self):
        return '\n'.join(map(lambda r: '   '.join(map(str, r)), self.matrix)) + '\n'

    def __add__(self, other):
        return Matrix(map(lambda r_1, r_2: map(lambda x, y: x + y, r_1, r_2), self.matrix, other.matrix))


my_m1 = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
my_m2 = Matrix([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
print(my_m1)
print(my_m2)
s = my_m1 + my_m2
print(s)
