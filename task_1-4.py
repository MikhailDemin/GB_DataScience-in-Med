num = int(input('enter any number'))
max_digit = 0
while num > 0:
    digit = num % 10
    if digit > max_digit:
        max_digit = digit
        if max_digit == 9:
            break
    num //= 10
print(max_digit)
