import telebot
from config import TOKEN_API
from worker import get_weather, get_time
from telebot import types
from transformers import AutoTokenizer, AutoModelWithLMHead, pipeline
#Get bot
token = TOKEN_API
bot = telebot.TeleBot(token)
#Load file
text_infile = open('my_file.txt', 'r', encoding='utf-8').read()
#Load chat model
tokenizer = AutoTokenizer.from_pretrained("DeepPavlov/nllb-200-distilled-600M-ru-persona-chat")
model_deep = AutoModelWithLMHead.from_pretrained("DeepPavlov/nllb-200-distilled-600M-ru-persona-chat")
#Load mediacal model
qa_pipeline = pipeline(
     "question-answering",
     model="Den4ikAI/rubert_large_squad_2",
     tokenizer="Den4ikAI/rubert_large_squad_2")

city = ''

def get_buttons():
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    item1 = types.KeyboardButton("Погода")
    item2 = types.KeyboardButton("Болталка")
    item3 = types.KeyboardButton("Время")
    item4 = types.KeyboardButton("Медицина")
    markup.add(item1, item2)
    markup.add(item3, item4)
    return markup

@bot.message_handler(commands=['start'])
def start_message(message):
    bot.send_message(message.chat.id,'Привет!')
    bot.send_message(message.chat.id, 'Привет! Выберите тему', reply_markup=get_buttons())

@bot.message_handler(content_types=['text'])
def message_reply(message):
    if message.text=="Погода":
        bot.send_message(message.chat.id,"Введите город")
        bot.register_next_step_handler(message, weather_reply)
    elif message.text == "Болталка":
        bot.send_message(message.chat.id, "Давайте переговорим")
        bot.register_next_step_handler(message, chat_reply)
    elif message.text=="Время":
        bot.send_message(message.chat.id,"Введите город")
        bot.register_next_step_handler(message, time_reply)
    elif message.text=="Медицина":
        bot.send_message(message.chat.id,"Медицина")
        bot.register_next_step_handler(message, medical_reply)

def weather_reply(message):
    global city
    city = message.text
    bot.send_message(message.chat.id, str(get_weather(city)))
    bot.send_message(message.chat.id, 'Выберите тему', reply_markup=get_buttons())

def time_reply(message):
    global city
    city = message.text
    bot.send_message(message.chat.id, str(get_time(city)))
    bot.send_message(message.chat.id, 'Выберите тему', reply_markup=get_buttons())

def chat_reply(message):
    prompt = message.text
    tokenized_prompt = tokenizer.encode(prompt, return_tensors="pt")
    generated_response = model_deep.generate(tokenized_prompt, max_length=50)
    generated_response_text = tokenizer.decode(generated_response[0], skip_special_tokens=True)
    bot.send_message(message.chat.id, str(generated_response_text))
    bot.send_message(message.chat.id, 'Выберите тему', reply_markup=get_buttons())

def medical_reply(message):
    predictions = qa_pipeline({
        'context': text_infile,
        'question': message.text
    })
    bot.send_message(message.chat.id, predictions['answer'])
    bot.send_message(message.chat.id, 'Выберите тему', reply_markup=get_buttons())

if __name__ == "__main__":
    bot.infinity_polling()