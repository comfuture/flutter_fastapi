import uvicorn


def run_server(app):
    uvicorn.run(app, port=9999)


if __name__ == '__main__':
    run_server()
