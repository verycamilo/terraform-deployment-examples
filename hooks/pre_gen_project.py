import json

context_str = r"""
{{ cookiecutter | jsonify }}
"""
context = json.loads(context_str)
print(f"context: {context}")