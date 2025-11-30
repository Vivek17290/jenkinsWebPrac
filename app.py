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