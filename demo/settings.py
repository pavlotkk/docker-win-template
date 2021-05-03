import os

from dotenv import dotenv_values

config = {
    **dotenv_values(os.path.join(os.getcwd(), ".env")),
    **os.environ
}

VERSION = "0.0.0-alfa"

APP_HOST = config['APP_HOST']
APP_PORT = int(config['APP_PORT'])
APP_DEBUG = bool(config['APP_DEBUG'])
