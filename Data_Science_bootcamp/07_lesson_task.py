# from pprint import pprint


class User:
    user_count = 0

    def __init__(self, name, login, password):
        User.user_count += 1
        self._name = name
        self._login = login
        self._password = password

    @property
    def name(self):
        return self._name

    @name.setter
    def name(self, value):
        self._name = value

    @property
    def login(self):
        return self._login

    def set_password(self, value):
        self._password = value

    password = property(fset=set_password)

    def show_info(self):
        return f'name: {self.name}\nlogin: {self.login}'
        # return f'name: {self.name}, login: {self.login}'


class SuperUser(User):
    admin_count = 0

    def __init__(self, name, login, password, role):
        super().__init__(name, login, password)
        SuperUser.admin_count += 1
        self._role = role

    @property
    def role(self):
        return self._role

    @role.setter
    def role(self, value):
        self._role = value

    def show_info(self):
        return super().show_info() + '\n' + f'role: {self.role}'
        # return super().show_info() + f', role: {self.role}'


if __name__ == '__main__':
    user1 = User('Alex', 'coder', '26e&%wWr')
    user2 = User('Ivan', 'typer', 'gs#gF732')
    user3 = User('Richy', 'rich', '$^&y5d6g')
    admin = SuperUser('Paul', 'owner', 'Js5$%&k7', 'admin')

# pprint(User.__dict__)

print(f'total users: {User.user_count}')
print(f'total admins: {SuperUser.admin_count}')
print(user1.show_info())
print(admin.show_info())
