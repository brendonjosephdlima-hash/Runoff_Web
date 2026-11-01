@echo off
rem Serves this folder locally and opens the game (3D models can't load from file://)
cd /d "%~dp0"
start "" http://localhost:8000
python -m http.server 8000
