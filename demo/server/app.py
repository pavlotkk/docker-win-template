from flask import Flask

from demo import settings

app = Flask(__name__)


@app.route('/', methods=['GET'])
@app.route('/index', methods=['GET'])
def index():
    return {'version': settings.VERSION}

