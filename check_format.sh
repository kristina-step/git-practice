#!/bin/bash

# Поиск всех .txt файлов в репозитории
TXT_FILES=$(find . -type f -name "*.txt")

# Переменная для отслеживания ошибок
ERRORS_FOUND=false

# Проверка каждого .txt файла
for FILE in $TXT_FILES; do
    # Проверка наличия больших букв в файле
    if grep -q '[A-Z]' "$FILE"; then
        echo "Ошибка: Файл $FILE содержит большие буквы. Формат не соответствует требованиям."
        ERRORS_FOUND=true
    fi
done

# Вывод результата проверки
if [ "$ERRORS_FOUND" = true ]; then
    echo "Ошибки обнаружены. Необходимо исправить перед коммитом."
    exit 1
else
    echo "Формат всех .txt файлов соответствует требованиям."
    exit 0
fi
