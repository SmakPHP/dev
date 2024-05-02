### dev

```bash
ssh-keygen -t ed25519 -C "apmasterov@gmail.com"
cat ~/.ssh/id_ed25519.pub

git config --global user.name AndreyMs
git config --global user.email apmasterov@gmail.com

cd C:/Soft/ftp/data/Dev
git clone https://github.com/SmakPHP/dev.git

git status
git pull origin main
git add -A
git commit -m "fix"
git push origin main
```
