# Парадокс Монти Холла.
# Участнику игры заранее известны следующие правила:
#
# 1. автомобиль равновероятно размещён за любой из трёх дверей;
# 2. ведущий знает, где находится автомобиль;
# 3. ведущий в любом случае обязан открыть дверь с козой (но не ту, которую выбрал игрок)
# и предложить игроку изменить выбор;
# 4. если у ведущего есть выбор, какую из двух дверей открыть (то есть, игрок указал
# на верную дверь, и за обеими оставшимися дверями — козы), он выбирает любую из них с
# одинаковой вероятностью.
import random
from random import randint
from random import choice


def monty_hall_attempt(first_choice, change_door):
    prize = randint(1, 3)

    monty_doors = [i for i in range(1, 4)]
    monty_doors.remove(prize)
    if first_choice not in monty_doors:
        monty_choice = choice(monty_doors)
    else:
        monty_doors.remove(first_choice)
        monty_choice = choice(monty_doors)

    player_doors = [i for i in range(1, 4)]
    player_doors.remove(monty_choice)
    if not change_door:
        player_choice = first_choice
    else:
        player_doors.remove(first_choice)
        player_choice = choice(player_doors)

    if player_choice == prize:
        result = True
    else:
        result = False

    return result


# trials = int(input('Enter number of trials: '))
trials = 10000
print(f'Number of trials: {trials}\n')
win = 0

for n in range(trials):
    first_choice = randint(1, 3)
    attempt = monty_hall_attempt(first_choice, True)
    if attempt:
        win += 1

print('If player changes door:')
print(f'win: {win}\nlosses: {trials - win}')
print(f'win probability = {(win/trials):.2%} or 2/3\n')

win = 0

for n in range(trials):
    first_choice = randint(1, 3)
    attempt = monty_hall_attempt(first_choice, False)
    if attempt:
        win += 1

print('If player not changes door:')
print(f'win: {win}\nlosses: {trials - win}')
print(f'win probability = {(win/trials):.2%} or 1/3')

##############################################################################################
# Разбор преподавателя:


# def monty_hall(choice, change):
#     doors = random.randrange(1, 4)
#     if doors == choice:
#         if change:
#             return False
#         else:
#             return True
#     else:
#         if change:
#             return True
#         else:
#             return False
#
#
# games = 10000
# result = 0
#
# for i in range(games):
#     choice = random.randrange(1, 4)
#     if monty_hall(choice, True):
#         result += 1
#
# print(f'win probability with change door = {(result/games):.2%} or 2/3\n')
#
# result = 0
#
# for i in range(games):
#     choice = random.randrange(1, 4)
#     if monty_hall(choice, False):
#         result += 1
#
# print(f'win probability with no change door = {(result/games):.2%} or 1/3')
