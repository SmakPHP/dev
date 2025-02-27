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

## Установка Node.js, Angular с использованием NVM(Node Version Manager):

```bash
apt update
apt install curl
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc # (или перезагрузить терминал)
nvm --version
nvm install 18
# nvm uninstall 18
nvm use 18

node -v
npm -v

cd /git/frontend
# rm -rf node_modules package-lock.json
# npm uninstall -g @angular/cli

# Установка Angular согласно package.json
npm install --legacy-peer-deps
ng version
```

## Установка зависимостей и полезные команды Node.js:

```bash
# https://habr.com/ru/companies/gazprombank/articles/725992/
# https://github.com/nvm-sh/nvm

# Пакет @agm/core@3.0.0-beta.0 требует для своей работы версии @angular/common, 
# которые соответствуют диапазону версий ^9.1.0 || ^10.0.0. 
# Это означает, что подойдут следующие версии:
# Angular 9.x: любая версия, начиная с 9.1.0 и выше, но ниже 10.0.0.
# Angular 10.x: любая версия, начиная с 10.0.0 и выше, но ниже 11.0.0.

# Установленные пакеты
npm list --depth=0 # (list -g глобальные)

# Проверка отсутствующих пакетов
npm outdated

# Удалить все неиспользуемые пакеты и очистить проект
npm prune

# Установка всех зависимостей, указанных в package.json
npm install --legacy-peer-deps

# Просмотр требующихся зависимостей для данной версии пакета
npm info @katoid/angular-grid-layout@2.1.0 peerDependencies

# Просмотр списока версий пакета
# https://www.npmjs.com/package/@agm/core?activeTab=versions
npm show @katoid/angular-grid-layout versions --json
```

## Links (+Ctrl)
1. [Markdown Preview](https://markdownlivepreview.com/)
