# Create a plain text README.md file for Flask server with Jenkins Freestyle
readme_text = """
Flask Server – Jenkins Freestyle CI Setup
=========================================

Overview
--------
This project demonstrates a simple Flask server integrated with Jenkins Freestyle Project.
The Jenkins build is divided into 3 phases: Install, Build, and Test.
It works on Windows Jenkins nodes and can optionally run using Docker.

Project Structure
-----------------
flask-server/
- app.py
- requirements.txt
- docker-compose.yml (optional)
- README.md

Flask App Example (app.py)
--------------------------
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return jsonify({"message": "Flask server running!"})

@app.route("/test")
def test():
    return jsonify({"status": "success", "data": "Test API works!"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)


Requirements (requirements.txt)
------------------------------
flask


Jenkins Freestyle Project Setup (3 Phases)
------------------------------------------

1. Install Phase
   Goal: Install Python dependencies
   Windows Build Step (Execute Windows batch command):
   echo Installing dependencies...
   pip install -r requirements.txt

2. Build Phase
   Goal: Check Python syntax / validate code
   Windows Build Step:
   echo Checking syntax...
   python -m py_compile app.py
   if errorlevel 1 exit /b 1

3. Test Phase
   Goal: Run Flask server in background and test API
   Windows Build Step:
   echo Running Flask server in background...
   start /b python app.py

   timeout /t 5

   echo Testing API...
   curl -f http://127.0.0.1:5000/test
   if errorlevel 1 exit /b 1

   echo Stopping Flask server...
   taskkill /im python.exe /f


Optional: Docker Support
------------------------
docker-compose.yml
services:
  flaskapp:
    image: python:3.10
    working_dir: /app
    volumes:
      - .:/app
    command: python app.py
    ports:
      - "5000:5000"

Run the server using:
docker-compose up


Notes
-----
- Windows Jenkins → Use Execute Windows batch command.
- Linux Jenkins → Use Execute shell with & and sleep 5.
- No extra scripts like test.sh are required; everything runs directly in build steps.
"""

file_path = "/mnt/data/Flask_Jenkins_Freestyle_README.md"
with open(file_path, "w", encoding="utf-8") as f:
    f.write(readme_text)

file_path
