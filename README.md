# Flutter FastAPI

Cross-platform Flutter app template with a Python FastAPI backend.

## Stack

- Flutter stable `3.44.4`
- Dart `3.12.2`
- Python `3.13`
- FastAPI `0.138.2`
- uv-managed Python dependencies with a tracked `uv.lock`

## Getting Started

Create a repository from this template and open it in VS Code.

For the recommended environment, run `Dev Containers: Reopen in Container`.
The dev container installs the Flutter SDK image, Java 21, Python 3.13, the latest uv, and then runs:

```sh
uv sync --frozen
flutter pub get
```

The dev container targets GitHub Codespaces and x64 Linux containers. It does not force Docker to emulate another platform. On Apple Silicon or other arm64 hosts, use the local setup commands below instead of reopening in a container.

For local development without the dev container:

```sh
uv sync
flutter pub get
```

Run both the backend and app from the VS Code `Run All` compound launch configuration, or run them manually:

```sh
PYTHON_ENV=development uv run uvicorn server:app --port 9999 --reload
flutter run -d web-server --web-hostname 0.0.0.0 --web-port 9090
```

## Features

- Dev container configuration based on prebuilt images and Dev Container Features instead of a custom Flutter SDK build.
- FastAPI backend managed by uv and locked with `uv.lock`.
- Flutter web development on `:9090` with the FastAPI backend on `:9999`.
- Development-only CORS for Flutter web requests.
- GitHub Actions samples for backend checks, Flutter analysis/tests, and Android, iOS, macOS, Windows, and web builds.
