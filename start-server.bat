@echo off
rem Serves this folder at http://localhost:8000 and opens it in the browser.
cd /d "%~dp0"
start "" http://localhost:8000
python -m http.server 8000
