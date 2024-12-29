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
cat ~/.ssh/id_ed25519.pub

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
```

## Установка Node, Angular с использованием NVM(Node Version Manager):

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
npm install -g @angular/cli@13
npm install -g @angular-devkit/build-angular

ng version

# https://github.com/nvm-sh/nvm
```

## Links (+Ctrl)
1. [Markdown Preview](https://markdownlivepreview.com/)
