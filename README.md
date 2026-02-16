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
ssh-keygen -t ed25519 -C "a@gmail.com"
type .ssh\id_ed25519.pub

# Linux
ssh-keygen -t ed25519 -C "a@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub

git config --global user.name AndreyMs
git config --global user.email a@gmail.com

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

#
# Авторизация
#

# Создание ключа ssh-rsa под windows
ssh-keygen -t rsa -b 4096
# Конвертация существующих ключей в PEM (для python скриптов)
ssh-keygen -f .ssh/id_rsa -e -m pem > .ssh/id_rsa.pem
# Копирование ключа на сервер
# cat .ssh\id_rsa.pub (просмотр)
# Создать директорию и добавить ключ одной командой
cat .ssh\id_rsa.pub | ssh smak@1.2.3.4 "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
# Проверка авторизации
ssh smak@1.2.3.4

# Создать пользователя с домашней директорией
useradd -m smak
grep smak /etc/passwd
# Установить пароль
passwd smak
# Удалить пользователя
userdel smak
# Проверить существование директории
ls -la /home/
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
