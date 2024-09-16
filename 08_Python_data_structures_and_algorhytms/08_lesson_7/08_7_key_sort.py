from collections import namedtuple
from operator import attrgetter

Person = namedtuple('Person', 'name, age')

p_1 = Person('Ivan', 25)
p_2 = Person('Petr', 30)
p_3 = Person('Olga', 23)

people = [p_1, p_2, p_3]
print(people)


def by_age(person):
    return person.__age


result = sorted(people, key=by_age)
print(result)

res_2 = sorted(people, key=attrgetter('age'))
print(res_2)
