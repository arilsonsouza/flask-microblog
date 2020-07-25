import os

BASEDIR = os.path.abspath(os.path.dirname(__file__))

POSTGRES_URL = os.environ.get('POSTGRES_URL')
POSTGRES_USER = os.environ.get('POSTGRES_USER')
POSTGRES_PW = os.environ.get('POSTGRES_PW')
POSTGRES_DB = os.environ.get('POSTGRES_DB')

DB_URL = f'postgresql+psycopg2://{POSTGRES_USER}:{POSTGRES_PW}@{POSTGRES_URL}/{POSTGRES_DB}'

class Config(object):
	SECRET_KEY = os.environ.get('SECRET_KEY') or 'you-will-never-guess'

	SQLALCHEMY_DATABASE_URI = DB_URL or 'sqlite:///' + os.path.join(BASEDIR, 'app.db')
	SQLALCHEMY_TRACK_MODIFICATIONS = False