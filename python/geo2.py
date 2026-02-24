# Run

# mkdir geo2 & cd geo2
# python3 -m venv ~/geo2
# source ~/geo2/bin/activate
# gunicorn -b 0.0.0.0:88 geo2:app
# pgrep -f "gunicorn -b 0.0.0.0:88 geo2:app"
# pkill -TERM gunicorn
# pkill -QUIT gunicorn

# https://dvmn.org/encyclopedia/web-server/deploy-wsgi-gunicorn-django-flask/
# https://github.com/P3TERX/GeoLite.mmdb
# wget https://git.io/GeoLite2-ASN.mmdb
# wget https://git.io/GeoLite2-City.mmdb

# pip install gunicorn flask geoip2
from flask import Flask, request, Response
import geoip2.database
import os

app = Flask(__name__)

# Пути к файлам
ASN_DB = 'GeoLite2-ASN.mmdb'
FILTER_FILE = 'filter.txt'
ADD_FILE = '/etc/danted.conf'

def add_to_filter(cidr):
    # Добавляет CIDR в файл, если его там нет
    if not os.path.exists(FILTER_FILE):
        open(FILTER_FILE, 'w').close()

    with open(FILTER_FILE, 'r+') as f:
        lines = f.read().splitlines()
        if cidr not in lines:
            f.write(cidr + '\n')

            # Добавляем запись в конфиг
            with open(ADD_FILE, 'r') as f:
                lines = f.readlines()
            last_index = -1
            for i, line in enumerate(lines):
                if line.strip().startswith('client pass'):
                    last_index = i
            if last_index != -1:
                add = 'client pass { from: ' + cidr + ' to: 0.0.0.0/0 }\n'
                lines.insert(last_index + 1, add)
                with open(ADD_FILE, 'w') as f:
                    f.writelines(lines)

            return True
    return False

@app.route("/")
def index():
    return Response("y2be.ru"), 200

@app.route('/db_ip')
def db_ip():
    with open(FILTER_FILE, 'r', encoding='utf-8') as f:
        content = f.read()
    return f"<html><body><pre>{content}</pre></body></html>"

@app.route('/check_ip')
def check_ip():
    # Берем IP из параметров запроса (?ip=1.2.3.4) или определяем IP посетителя
    ip = request.args.get('ip') or request.remote_addr
    
    try:
        with geoip2.database.Reader(ASN_DB) as reader:
            response = reader.asn(ip)
            cidr = str(response.network) # Получаем маску, например 2.60.160.0/19
            provider = response.autonomous_system_organization

            added = add_to_filter(cidr)
            
            status = f"Добавлено: {cidr}" if added else "Уже существует"
            return {
                "ip": ip,
                "cidr": cidr,
                "provider": provider,
                "status": status
            }
    except Exception as e:
        return {"error": str(e)}, 400

if __name__ == '__main__':
    # app.run(port=5000)
    app.run(debug=True)
