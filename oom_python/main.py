from flask import Flask, jsonify

app = Flask(__name__)


@app.route('/oom')
def oom():
    memory_list = []
    while True:
        # Allocate 100MB at a time
        memory_list.append(bytearray(100 * 1024 * 1024))
    return jsonify(message='Escaped the loop out of memory'), 500

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080) 
