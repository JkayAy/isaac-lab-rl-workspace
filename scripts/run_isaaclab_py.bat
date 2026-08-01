@echo off
REM Run a Python script under Isaac Lab with venv + EULA (pip install workflow).
call "%~dp0_common.bat" || exit /b 1
"%ISAACLAB_PYTHON%" %*
exit /b %ERRORLEVEL%
