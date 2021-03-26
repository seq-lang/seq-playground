from flask import Flask
from flask import request
from flask_cors import CORS
from subprocess import run, PIPE, STDOUT, TimeoutExpired

app = Flask(__name__)
CORS(app)

@app.route('/seq_exec',  methods=['POST'])
def seq_exec():
    req_data = request.get_json()
    if 'code' not in req_data:
        return ''
    code = req_data['code']
    try:
        p = run(['docker', 'run', '--memory', '1024m', '--memory-swap', '0', '-i', '--rm', 'seq-playground', 'seqc', 'run'],
                stdout=PIPE, stderr=STDOUT, input=str.encode(code), timeout=20)
    except TimeoutExpired:
        return 'execution timed out'
    return p.stdout
