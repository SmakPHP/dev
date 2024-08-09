# Run:
# python backup_zip_7.py

import os
import time
import zipfile
from datetime import datetime, timedelta

# Определяем директорию для сканирования
source_dir = '/var/www'

# Получаем текущую дату и дату неделю назад
current_time = time.time()
week_ago = current_time - 7 * 24 * 60 * 60

# Создаем имя архива с текущей датой
archive_name = f'weekly_backup_{datetime.now().strftime("%Y%m%d_%H%M%S")}.zip'

# Создаем архив
with zipfile.ZipFile(archive_name, 'w') as zipf:
    for root, dirs, files in os.walk(source_dir):
        for file in files:
            file_path = os.path.join(root, file)
            # Проверяем время модификации файла
            if os.path.getmtime(file_path) > week_ago:
                # Добавляем файл в архив, сохраняя структуру директорий
                zipf.write(file_path, os.path.relpath(file_path, source_dir))

print(f'Архив создан: {archive_name}')
