@echo off
setlocal
cd /d "%~dp0"
if not defined API_BASE set "API_BASE=http://127.0.0.1:8082"
if not defined DEMO_PORT set "DEMO_PORT=9002"
if not defined PYTHONIOENCODING set "PYTHONIOENCODING=utf-8"
echo Open the Gradio demo against %API_BASE% (start run.bat first).
python demo
exit /b %ERRORLEVEL%
