import os

from flask import Flask


app = Flask(__name__)

@app.route("/")
def hello_world():
    target = os.getenv("TARGET", "World")

    return f"Hello {target}!\n"


if __name__ == "__main__":
    app.run(
        debug=True,
        host="127.0.0.1",
        port=int(os.environ.get("PORT", 8080))
    )
