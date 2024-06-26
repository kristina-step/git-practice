# Лабораторная работа №5
## Создание и клонирование репозитория
Для выполнения 5 лабораторной работы я для начала создала новый репозиторий "git-practice"
создала текстовый файл example.txt и добавила его в этот репозиторий:
![image](https://github.com/kristina-step/git-practice/assets/157066665/68679cc3-347f-4d41-9fde-917a40e00139)
![image](https://github.com/kristina-step/git-practice/assets/157066665/e1147efb-6643-4dac-926e-876e610b6a28)
После чего создала новую ветку и переключилась на неё с помощью команд:
```
git branch feature-branch
git checkout feature-branch
```
После этого внесла изменения в файл, загрузила его на новую ветку, а после, слиянием добавила изменения в основную ветку
![image](https://github.com/kristina-step/git-practice/assets/157066665/fc8ada21-df5b-40b1-9cdf-270f8fc90bfc)
![image](https://github.com/kristina-step/git-practice/assets/157066665/3c6e95f6-5853-4072-8e1e-c56118791f63)
![image](https://github.com/kristina-step/git-practice/assets/157066665/96efd901-da99-43d2-a908-ce8cb1f3ed89)
![image](https://github.com/kristina-step/git-practice/assets/157066665/551beca2-7065-49c6-9b7f-76051acfc454)
##Работа с ветками
Для выполнения этой части лабораторной работы я создала новый файл book.txt, куда добавила структуру книги и запушила на гитхаб
![image](https://github.com/kristina-step/git-practice/assets/157066665/6f89023b-9db0-49cd-a5c6-9e571812e35f)
![image](https://github.com/kristina-step/git-practice/assets/157066665/3ec735aa-e922-4f32-b759-4b706146450c)
![image](https://github.com/kristina-step/git-practice/assets/157066665/eee6bf36-537b-40c7-8e6a-cf6fe965478e)
![image](https://github.com/kristina-step/git-practice/assets/157066665/c26e60cc-89ab-40e1-8983-a4bb299bae5d)

## Работа с удаленным репозиторием
Для выполнения этой части лабораторной работы переключились на ветку main, затем внесли изменения в файл
![image](https://github.com/kristina-step/git-practice/assets/157066665/e5266efe-3819-47dd-af25-fa5e40262118)

После запушили на гитхаб
![image](https://github.com/kristina-step/git-practice/assets/157066665/0b7b43bc-0e62-4265-aaf9-c240515c5f35)


## Моделирование конфликта
В этом разделе мы внесли изменения в файл book.txt
![image](https://github.com/kristina-step/git-practice/assets/157066665/00d6a5c8-7bbf-44c4-ac44-d3d3d7846ca4)

А затем добавилили их в ветку feature-login
![image](https://github.com/kristina-step/git-practice/assets/157066665/0b2ac113-30d1-49cd-b527-6144f452ac8a)

## Разрешение конфликта
Переключились на ветку main, после попытки слияния двух веток произошел конфликт:
![image](https://github.com/kristina-step/git-practice/assets/157066665/aaf98c44-dc13-468a-88ff-d08b4a9d2e1d)
![image](https://github.com/kristina-step/git-practice/assets/157066665/23bc3f56-7694-4b9c-90a3-61da12163e02)
Внесли изменения в текстовый файл:
![image](https://github.com/kristina-step/git-practice/assets/157066665/a4e559f7-a5f4-48f7-94c4-59cbb56f2573)
После внесения изменений залили их на гитхаб ветку main
![image](https://github.com/kristina-step/git-practice/assets/157066665/1881cc3e-ee53-469a-af5e-e652d985b536)
##Автоматизация проверки формата файлов при коммите
Для проверки, что все файлы соответствуют определенному формату .txt, я создала скрипт check_format.sh на баше, используя grep для проверки, что все загруженные файлы имеют окончание .txt.
```
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
```
Эта программа написана на языке оболочки Bash и выполняет следующие шаги:

1. Поиск .txt файлов:
   - С использованием команды find программа ищет все файлы с расширением ".txt" в текущем репозитории и его поддиректориях. Результат сохраняется в переменной TXT_FILES.

2. Проверка наличия ошибок:
   - Затем программа инициализирует переменную ERRORS_FOUND как "false" для отслеживания наличия ошибок.

3. Цикл проверки каждого .txt файла:
   - В цикле for программа проверяет каждый найденный .txt файл. 
   - Для каждого файла используется команда grep, которая ищет наличие больших букв в файле. Если хотя бы одна большая буква обнаруживается, выводится сообщение об ошибке, и переменная ERRORS_FOUND устанавливается в "true".

4. Вывод результатов проверки:
   - После проверки всех файлов программа выводит результат.
   - Если были обнаружены ошибки (переменная ERRORS_FOUND установлена в "true"), выводится сообщение о необходимости исправлений перед коммитом, и программа завершает выполнение с кодом ошибки "1".
   - Если ошибок не обнаружено, выводится сообщение о том, что формат всех .txt файлов соответствует требованиям, и программа завершает выполнение с кодом "0".

Таким образом, эта программа предназначена для автоматизированной проверки всех .txt файлов в репозитории на наличие больших букв и информирования пользователя о результатах проверки.
![image](https://github.com/kristina-step/git-practice/assets/157066665/48a19cfc-b993-4415-8796-b67c9781c2fe)
![image](https://github.com/kristina-step/git-practice/assets/157066665/ba0e3add-736a-46b1-8c40-0b161dd6b832)
После внедрения написанной нами функции посмотрим на ее работоспособность
![image](https://github.com/kristina-step/git-practice/assets/157066665/a4d02293-bae2-43e7-977c-a87e1be93ea7)

![image](https://github.com/kristina-step/git-practice/assets/157066665/eaffb5b7-58c1-442c-8694-54fab571e349)
Все работает как надо

## Использование Git Flow в проекте
Для начала установили сам git flow
![image](https://github.com/kristina-step/git-practice/assets/157066665/e5c31afd-0b2e-4cc8-a25a-c55d3e80e7d0)
![image](https://github.com/kristina-step/git-practice/assets/157066665/1c17de59-8c40-48d8-abb8-0cf1c99fbfcc)
Используя его и предложенный код, я создала функциональность task-management и доюавила в нее предложенный код task_manager.py. В интерактивном окне vi я добавила актуальное сообщение коммита с помощью i (insert), затем нажала escape и написал :wq (write & quit). Окно vi закрылось, и feature был корректно присоединен к ветке develop, которую создала git flow.
![image](https://github.com/kristina-step/git-practice/assets/157066665/552da2af-96ed-4690-8b51-d5d3e00111f3)
![image](https://github.com/kristina-step/git-practice/assets/157066665/e2721e0d-60eb-48f8-a292-3c1e5c5e87e4)
![image](https://github.com/kristina-step/git-practice/assets/157066665/38ae32f9-2632-48a0-89a2-9934ecd3b423)
в результате Завершили релиз и объединили его с ветками "feature-branch" и "main"
