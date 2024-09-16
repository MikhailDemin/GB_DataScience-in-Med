from pprint import pprint


class Animal:
    name = 'Name'
    __age = 0

    def __init__(self, name, age):
        self.name = name
        self.__age = age

    @property
    def age(self):
        return self.__age

    @age.setter
    def age(self, value):
        if value > 0:
            self.__age = value
        else:
            print('Data error')

    # age = property(fget=get_age(), fset=set_age())

    def voice(self):
        print('Voice')

    @classmethod
    def info(cls):
        print(cls.name, cls.__age)
        cls.voice(cls)

    @staticmethod
    def eat():
        print('Eating')


class Cat(Animal):
    def __init__(self, name, age, color):
        super().__init__(name, age)
        self.color = color

    def voice(self):
        super().voice()
        print('Meow')

    @staticmethod
    def eat():
        print('Eating2')

    def info(self):
        print(self.name, self.age, self.color)


class Dog(Animal):
    def __init__(self, name, age, color):
        super().__init__(name, age)
        self.color = color

    def voice(self):
        super().voice()
        print('Woof')

    @staticmethod
    def eat():
        print('Eating3')

    def info(self):
        print(self.name, self.age)

    def __repr__(self):
        return f'{self.name} {self.age} {self.color}'


# cat = Animal(name='Vaska', age=3)
# dog = Animal(name='Reks', age=5)

cat = Cat(name='Vaska', age=3, color='red')
dog = Dog(name='Reks', age=5, color='black')

pprint(Animal.__dict__)
