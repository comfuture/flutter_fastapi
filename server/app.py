import os
from fastapi import FastAPI
from fastapi.logger import logger
from fastapi.staticfiles import StaticFiles
from fastapi.middleware.cors import CORSMiddleware


def create_app():
    """creates the app"""
    app = FastAPI()

    is_dev = os.environ.get('PYTHON_ENV', 'development') == 'development'

    if is_dev:
        logger.info('Running in development mode')
        setup_cors(app)

    @app.get("/hello")
    def hello():
        return {"message": "Hello World"}

    n = 0
    @app.post('/inc')
    def inc():
        nonlocal n
        n += 1
        return {"n": n}

    if os.path.isdir('build/web'):
        app.mount('/', StaticFiles(directory='build/web', html=True), name='flutter_web')
        logger.info('Flutter web is mounted')

    return app


def setup_cors(app):
    """allows cross origin requests only for development"""
    origins = [
        'http://localhost:9090',
        'http://127.0.0.1:9090',
    ]
    app.add_middleware(CORSMiddleware, allow_origins=origins,
                       allow_credentials=True, allow_methods=['*'],
                       allow_headers=['*'])
    logger.info('CORS is enabled')
