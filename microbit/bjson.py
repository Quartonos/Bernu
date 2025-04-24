# ujson.py – minimal MicroPython-compatible JSON parser

def loads(s):
    s = s.strip()
    if not s.startswith('{') or not s.endswith('}'):
        raise ValueError("Only flat JSON objects supported")

    result = {}
    body = s[1:-1].strip()
    if not body:
        return result

    items = body.split(',')
    for item in items:
        key, val = item.split(':', 1)
        key = key.strip().strip('"')
        val = val.strip()

        if val == 'true':
            val = True
        elif val == 'false':
            val = False
        elif val.startswith('"') and val.endswith('"'):
            val = val[1:-1]
        elif '.' in val:
            try:
                val = float(val)
            except:
                pass
        else:
            try:
                val = int(val)
            except:
                pass

        result[key] = val
    return result

def dumps(obj):
    out = []
    for key in obj:
        val = obj[key]
        key_str = '"' + key + '"'
        if isinstance(val, str):
            val_str = '"' + val + '"'
        elif isinstance(val, bool):
            val_str = 'true' if val else 'false'
        else:
            val_str = str(val)
        out.append(key_str + ': ' + val_str)
    return '{' + ', '.join(out) + '}'

