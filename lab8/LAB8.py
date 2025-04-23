import redis
import random

r = redis.Redis(host='localhost', port=6379, decode_responses=True)

def start_game():
    secret = random.randint(1, 100)
    r.set('game:secret', secret)
    r.set('game:attempts', 0)
    r.set('game:status', 'playing')
    print("Я загадав число від 1 до 100. Спробуй вгадати!")


def play_game():
    while r.get('game:status') == 'playing':
        try:
            guess = int(input("Введи своє число: "))
        except ValueError:
            print("Це не число!")
            continue

        r.incr('game:attempts')
        secret = int(r.get('game:secret'))

        if guess < secret:
            print("Більше!")
        elif guess > secret:
            print("Менше!")
        else:
            attempts = r.get('game:attempts')
            print(f"Вітаю! Ти вгадав число за {attempts} спроб!")
            r.set('game:status', 'won')

# Запуск
if __name__ == "__main__":
    start_game()
    play_game()
