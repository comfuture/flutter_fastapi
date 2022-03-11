# Flutter Fastapi

cross platform Flutter apps template with python fastapi backend

## Getting Started

This project is a starting point for a Flutter application with python api server backend.

- Create a repository by using this template.
- Open it in vscode.
- run `Remote-Container: (Re)open in Container` at command palette.
- Install dependencies
  - pip install flit
  - flit install
  - flutter pub get
- Run `Run All` for launch server and app in `Run and Debug` sidebar.
- (You need to install 'Dart Debug Extension' on Chrome for remote debug.)

### Features

- Dev container
  > this template includes .devcontainer configurations. so you can start development from local docker containers or codespace.
- Github actions
  > github actions sample for automated build android, ios, macos, windows and web
- CORS for web development
  > api server runs on `:9999` but flutter app runs on `:9090` in development env. it automatically setup cors for incoming requests from flutter only on development env.
