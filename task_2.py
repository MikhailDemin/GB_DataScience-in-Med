user_input = int(input('enter time in seconds'))
hours = user_input // 3600
minutes = (user_input % 3600) // 60
seconds = (user_input % 3600) % 60
print(f"{hours:02}:{minutes:02}:{seconds:02}")