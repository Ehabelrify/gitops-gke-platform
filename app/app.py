from flask import Flask, render_template
import os
ENVIRONMENT = os.environ.get("ENVIRONMENT", "local")
POD_NAME = os.environ.get("POD_NAME", "local-dev-machine")

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html', environment=ENVIRONMENT, pod_name=POD_NAME)

@app.route('/docs')
def docs():
    return render_template('docs.html')

@app.route('/health')
def health():
    return {"status": "healthy"}, 200

@app.route("/api/info")
def info():
    return {"environment": ENVIRONMENT, 
            "pod_name": POD_NAME
            }, 200

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)
    