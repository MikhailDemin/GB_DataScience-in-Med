# 4. Начните работу над проектом «Склад оргтехники». Создайте класс, описывающий склад. А также класс «Оргтехника»,
# который будет базовым для классов-наследников. Эти классы — конкретные типы оргтехники (принтер, сканер, ксерокс).
# В базовом классе определить параметры, общие для приведенных типов. В классах-наследниках реализовать параметры,
# уникальные для каждого типа оргтехники.
# 5. Продолжить работу над первым заданием. Разработать методы, отвечающие за приём оргтехники на склад и передачу в
# определенное подразделение компании. Для хранения данных о наименовании и количестве единиц оргтехники, а также других
# данных, можно использовать любую подходящую структуру, например словарь.
# 6. Продолжить работу над вторым заданием. Реализуйте механизм валидации вводимых пользователем данных. Например, для
# указания количества принтеров, отправленных на склад, нельзя использовать строковый тип данных.
# Подсказка: постарайтесь по возможности реализовать в проекте «Склад оргтехники» максимум возможностей, изученных на
# уроках по ООП.
# my solution ####
class Stock:

    my_stock = {
        1: {'model': [], 'price': [], 'quantity': [], 'color': []},
        2: {'model': [], 'price': [], 'quantity': [], 'type': []},
        3: {'model': [], 'price': [], 'quantity': [], 'type': []}
    }

    def stock_add(self):
        new_item = input('Add new item?\n"q" for exit, "Enter" to continue: ')
        if new_item != 'q':
            return Stock.add_item(OffTech.add(0))
        else:
            return f'Exit'

    @staticmethod
    def add_item(*unit):
        try:
            for unit in [*unit]:
                data = unit.__dict__['unit']
                i = 1
                add_dict = Stock.my_stock.get(data[0])
                for k in add_dict:
                    Stock.my_stock.get(data[0])[k].append(data[i] if k == 'price' or k == 'quantity' else data[i])
                    i += 1
            if input('Success!\nWant add more item - press "Enter", for exit - press any key: ') == '':
                return Stock.add(0)
            else:
                return Stock.my_stock
        except AttributeError:
            print('Error\nPlease be correct!')


class OffTech:
    def __init__(self, model, price, quantity, id):
        self.model = model
        self.price = int(price)
        self.quantity = int(quantity)
        self.id = id

    def add(self):
        my_tech = {1: Printer, 2: Scanner, 3: Copier}
        try:
            id = int(input('For printer press "1", scanner - "2", copier - "3" '))
            if id > len(my_tech.keys()):
                print('ERROR')
            model = input('Enter model: ')
            price = int(input('Enter price: '))
            quantity = int(input('Enter quantity: '))
        except (ValueError, TypeError):
            return f'Input Error'
        return my_org.get(id).add_unit(0, model, price, quantity)


class Printer(OffTech):
    def __init__(self, model, price, quantity, color, id=1):
        super().__init__(model, price, quantity, id)
        self.color = color
        self.unit = (self.id, self.model, self.price, self.quantity, self.color)

    def add_unit(self, model, price, quantity):
        color = input('Enter printer color system: ')
        return Printer(model, price, quantity, color)

    def __str__(self):
        return f'Printer:\nModel: {self.model}\n' \
               f'Price: {self.price}\nQuantity: {self.quantity}\nColor: {self.color}'


class Scanner(OffTech):
    def __init__(self, model, price, quantity, type, id=2):
        super().__init__(model, price, quantity, id)
        self.type = type
        self.unit = (self.id, self.model, self.price, self.quantity, self.type)

    def add_unit(self, model, price, quantity):
        type = input('Enter scanner type: ')
        return Scanner(model, price, quantity, type)

    def __str__(self, ):
        return f'Scanner:\nModel: {self.model}\n' \
               f'Price: {self.price}\nQuantity: {self.quantity}\nColor: {self.type}'


class Copier(OffTech):
    def __init__(self, model, price, quantity, type, id=3):
        super().__init__(model, price, quantity, id)
        self.type = type
        self.unit = (self.id, self.model, self.price, self.quantity, self.type)

    def add_unit(self, model, price, quantity):
        type = input('Enter copier type: ')
        return Copier(model, price, quantity, type)

    def __str__(self):
        return f'Copier:\nModel: {self.model}\n' \
               f'Price: {self.price}\nQuantity: {self.quantity}\nColor: {self.type}'


def my_print(b):
    org = {1: 'printer', 2: 'scanner', 3: 'copier'}
    for k, v in b.items():
        if isinstance(v, dict):
            print(org.get(k))
            my_print(v)
        else:
            print(f'{k[:15]:>20}: {v}')
    print("*" * 30)


print_1 = Printer('Richon', 200, 2, 'w/b')
print_2 = Printer('hp', 200, 1, 'color')
unit_2 = Scanner('Canon', 4500, 3, '300dpi')
unit_3 = Copier('Xerox', 8000, 2, 'A4')

store = Stock.add_item(print_1, print_2, unit_2, unit_3)

try:
    my_print(store)
except AttributeError:
    print('Please add item before printing')
