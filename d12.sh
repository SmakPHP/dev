#!/bin/bash

# Execute bash script from link
# wget -O - https://raw.githubusercontent.com/smakphp/dev/main/d12.sh | bash

apt update -y
apt upgrade -y

apt install htop atop mc -y

sed -i 's/^#*ClientAliveInterval.*/ClientAliveInterval 3600/g' /etc/ssh/sshd_config
sed -i 's/^#*ClientAliveCountMax.*/ClientAliveCountMax 3/g' /etc/ssh/sshd_config


"""

# Использование journalctl для просмотра и анализа логов
# https://habr.com/ru/companies/ruvds/articles/533918/
# https://losst.pro/shpargalka-po-journalctl-v-linux

# Указание кода важности:
# journalctl -p 0

Для уровней важности, приняты следующие обозначения:

0: emergency (неработоспособность системы)
1: alerts (предупреждения, требующие немедленного вмешательства)
2: critical (критическое состояние)
3: errors (ошибки)
4: warning (предупреждения)
5: notice (уведомления)
6: info (информационные сообщения)
7: debug (отладочные сообщения)

# Конкретный PID:
journalctl _PID=1

# Просмотреть логи от NetworkManager
journalctl -u NetworkManager.service

# Следить за появлением новых сообщений (аналог tail -f):
journalctl -p 7 -f

# Открыть журнал «перемотав» его к последней записи
journalctl -e

"""