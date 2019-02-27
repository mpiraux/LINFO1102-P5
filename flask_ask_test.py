from flask import Flask
from flask_ask import Ask, statement, question

app = Flask(__name__)
ask = Ask(app, '/')


@ask.launch
def start():
    return question('Quel est votre nom ?')


@ask.intent('HelloIntent')
def bonjour(nom):
    if nom is None:
        return statement('Je ne connais pas ce nom, désolé')
    return statement("Bonjour {}".format(nom))


if __name__ == '__main__':
    app.run()

