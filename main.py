import uvicorn
from server.app import create_app

app = create_app()

if __name__ == '__main__':
    uvicorn.run(app, port=9999)
