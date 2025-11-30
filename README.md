# Flask Server – Jenkins Freestyle CI Setup

## Overview
This repository demonstrates a **simple Flask server** integrated with **Jenkins Freestyle Project**.  
It can build, install dependencies, and test the Flask server automatically on Windows or Linux nodes.

## Project Structure
flask-server/
│
├── app.py
├── requirements.txt
├── docker-compose.yml (optional)
└── README.md

python
Copy code

## Flask App Example (app.py)
```python
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
```

## Requirements
```
flask
```

## Jenkins Freestyle Project Setup

### 1️⃣ Source Code Management
Git repository URL: https://github.com/YOUR_USERNAME/YOUR_REPO.git

Branch: */main

### 2️⃣ Build Steps
**Windows Node – Execute Windows batch command:**

```batch
echo Installing dependencies...
pip install -r requirements.txt

echo Checking syntax...
python -m py_compile app.py

echo Testing API...
curl -f http://127.0.0.1:5000/test
```

**Linux Node – Execute shell:**

```bash
echo Installing dependencies...
pip install -r requirements.txt

echo Checking syntax...
python -m py_compile app.py

echo Testing API...
curl -f http://127.0.0.1:5000/test
```

### 3️⃣ Post-build Actions
- Archive Python scripts and requirements (*.py, requirements.txt)
- Optional: Email notification on build failure

## Docker Support (Optional)

### docker-compose.yml
```yaml
services:
  flaskapp:
    image: python:3.10
    working_dir: /app
    volumes:
      - .:/app
    command: python app.py
    ports:
      - "5000:5000"
```

Run the server with:

```bash
docker-compose up
```

## Notes
- Windows Jenkins → Use Execute Windows batch command.
- Linux Jenkins → Use Execute shell.
- Ensure Python and Flask are installed on the Jenkins node.
- No extra scripts like test.sh are required; commands run directly in build steps.




### options2 








































# Flask Server – Jenkins Freestyle CI Setup

## Overview
This repository demonstrates a **simple Flask server** integrated with **Jenkins Freestyle Project**.  
It can build, install dependencies, and test the Flask server automatically on Windows or Linux nodes.

## Project Structure
```
flask-server/
│
├── app.py
├── requirements.txt
├── docker-compose.yml   (optional)
└── README.md
```

## Flask App Example (app.py)
```python
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
```

## Requirements
```
flask
```

## Jenkins Freestyle Project Setup

### 1️⃣ Source Code Management
- Git repository URL: `https://github.com/YOUR_USERNAME/YOUR_REPO.git`
- Branch: `*/main`

### 2️⃣ Build Steps

**Windows Node – Execute Windows batch command:**
```batch
echo Installing dependencies...
pip install -r requirements.txt

echo Checking syntax...
python -m py_compile app.py

echo Testing API...
curl -f http://127.0.0.1:5000/test
```

**Linux Node – Execute shell:**
```bash
echo Installing dependencies...
pip install -r requirements.txt

echo Checking syntax...
python -m py_compile app.py

echo Testing API...
curl -f http://127.0.0.1:5000/test
```

### 3️⃣ Post-build Actions
- Archive Python scripts and requirements (`*.py`, `requirements.txt`)
- Optional: Email notification on build failure

## Docker Support (Optional)

### docker-compose.yml
```yaml
services:
  flaskapp:
    image: python:3.10
    working_dir: /app
    volumes:
      - .:/app
    command: python app.py
    ports:
      - "5000:5000"
```

Run the server with:
```bash
docker-compose up
```

## Notes
- Windows Jenkins → Use **Execute Windows batch command**.
- Linux Jenkins → Use **Execute shell**.
- Ensure Python and Flask are installed on the Jenkins node.
- No extra scripts like `test.sh` are required; commands run directly in build steps.

