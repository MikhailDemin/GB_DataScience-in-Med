import sys
import ctypes
import struct

a = 59

b = 124.54
c = 'Hello world!'
lst = [1, 2, 3, 4]

print(id(a))
print(sys.getsizeof(a))
print(ctypes.string_at(id(a), sys.getsizeof(a)))
print(struct.unpack('LLLLLLl', ctypes.string_at(id(a), sys.getsizeof(a))))
print(id(int))

print(ctypes.string_at(id(b), sys.getsizeof(b)))
print(struct.unpack('LLLd', ctypes.string_at(id(b), sys.getsizeof(b))))
print(id(float))

print(ctypes.string_at(id(c), sys.getsizeof(c)))
print(struct.unpack('LLLLLLLLLLli' + 'c' * 13, ctypes.string_at(id(c), sys.getsizeof(c))))
print(id(str))

print(ctypes.string_at(id(lst), sys.getsizeof(lst)))
print(struct.unpack('<LLLL' + 'L' * 5 * 4, ctypes.string_at(id(lst), sys.getsizeof(lst))))
print(id(list))

print(sys.getsizeof(lst))





