@echo off
REM Start Isaac Lab (Cartpole sanity check). Runs until you press Ctrl+C in the terminal.
set "N=%~1"
if "%N%"=="" set "N=4"
call "%~dp0smoke_test.bat" %N%
