import uvicorn

from .app import create_app

app = create_app()


def run_server():
    uvicorn.run(app, port=9999)

if __name__ == '__main__':
    run_server()
