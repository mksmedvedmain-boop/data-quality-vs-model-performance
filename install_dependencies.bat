@echo off

python -m venv .venv
call .venv\Scripts\activate

python -m pip install --upgrade pip
python -m pip install -r requirements.txt

echo.
echo All dependencies were installed successfully.
pause
