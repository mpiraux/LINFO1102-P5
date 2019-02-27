from flask import Flask
from flask_ask import Ask, statement, question

app = Flask(__name__)
ask = Ask(app, '/')


@ask.launch
def start():
    return question('Quel est votre nom ?')


@ask.intent('HelloIntent')
def hello(firstname):
    return statement("Bonjour {}".format(firstname))


if __name__ == '__main__':
    app.run()

