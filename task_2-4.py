user_input = input('enter something').split(' ')
for ind, el in enumerate(user_input):
    ind += 1
    if len(el) > 10:
        print(ind, el[:11])
    else:
        print(ind, el)
