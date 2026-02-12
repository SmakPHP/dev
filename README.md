## Git

```bash
# Добавление ключа
# https://github.com/settings/keys

# Замечания:
# 1. Если вы клонируете репозиторий по HTTPS
# (например, https://github.com/username/repo.git),
# Git требует аутентификацию через имя пользователя и пароль.
# SSH-ключи не используются в этом случае !

# Windows
ssh-keygen -t ed25519 -C "apmasterov@gmail.com"
type .ssh\id_ed25519.pub

# Linux
ssh-keygen -t ed25519 -C "apmasterov@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

git config --global user.name AndreyMs
git config --global user.email apmasterov@gmail.com

cd C:/Dev
git clone git@github.com:SmakPHP/dev.git

git status
git pull origin main
git add -A
git commit -m "fix"
git push origin main

# Создание ключа ssh-rsa
ssh-keygen -t rsa -b 4096
type .ssh\id_rsa.pub
```

## Pyutube

```bash
# https://pypi.org/project/pyutube/
# https://pypi.org/project/pytubefix/
# https://pypi.org/project/pybalt/

# Создание виртуального окружения (venv)
apt update && apt install python3-full python3-venv
python3 -m venv ~/pybalt_env
source ~/pybalt_env/bin/activate
which python
deactivate

pip install --upgrade pip
pip install PyYAML dotenv click aiohttp aiofiles requests fastapi uvicorn prompt_toolkit
pip install pybalt -U
pip show pybalt

# http://1.2.3.4:8080/ui
cobalt --api-port 8080 --api-start
cobalt --api-status
cobalt --api-stop

cobalt -c
cobalt "https://youtube.com/watch?v=DG2QqcHwNdE" -r -vQ max
cobalt "https://youtube.com/watch?v=DG2QqcHwNdE" -r -vQ max -fp "C:\Users\Trait\Videos\my_video.mp4"
```

## Links (+Ctrl)
1. [Markdown Preview](https://markdownlivepreview.com/)
