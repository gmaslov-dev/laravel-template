# Настройка

Когда вы переносите Laravel‑проект на новый ПК через Git, нужно выполнить **ряд обязательных шагов** — иначе проект не запустится. Вот чёткий чек‑лист команд.

## Базовый порядок действий

1. **Клонируйте репозиторий**
   ```bash
   git clone <ваш-репозиторий>
   cd <название-проекта>
   ```

2. **Установите зависимости Composer**
   ```bash
   composer install
   ```
   *Создаст `vendor/`, подгрузит пакеты из `composer.lock`.*

3. **Создайте `.env`-файл**
   ```bash
   cp .env.example .env
   ```
   *Копирует шаблон в рабочий файл окружения.*

4. **Сгенерируйте ключ приложения**
   ```bash
   php artisan key:generate
   ```
   *Заполнит `APP_KEY` в `.env` — критически важно для сессий и шифрования.*

5. **Настройте БД в `.env`**  
   Отредактируйте `.env` и укажите:
   ```env
   DB_CONNECTION=mysql        # или sqlite/pgsql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=your_db_name
   DB_USERNAME=your_db_user
   DB_PASSWORD=your_db_password
   ```
   *Для SQLite: `DB_DATABASE=database/database.sqlite`.*

6. **Создайте базу данных**
    - Для MySQL/PostgreSQL: создайте БД вручную через phpMyAdmin/PGAdmin.
    - Для SQLite:
      ```bash
      touch database/database.sqlite
      ```

7. **Запустите миграции**
   ```bash
   php artisan migrate
   ```
   *Создаст таблицы в БД.*

8. **Установите права на папки** (Linux/macOS)
   ```bash
   chmod -R 755 storage bootstrap/cache
   ```
   *Иначе Laravel не сможет писать логи и кэши.*

9. **Очистите кэш**
   ```bash
   php artisan config:clear
   php artisan cache:clear
   php artisan route:clear
   php artisan view:clear
   ```

10. **Запустите сервер**
    ```bash
    php artisan serve
    ```
    *Проект будет доступен по `http://localhost:8000`.*

## Если используются фронтенд‑ресурсы (Vue/React/Vite)

11. **Установите npm‑зависимости**
    ```bash
    npm install
    ```

12. **Соберите активы**
    ```bash
    npm run build     # для продакшена
    # или
    npm run dev       # для разработки
    ```

## Частые проблемы и их решение

- **«Class not found»** → запустите `composer dump-autoload`.
- **«No application encryption key»** → проверьте, выполнен ли `php artisan key:generate`.
- **«Database does not exist»** → убедитесь, что БД создана и `.env` настроен верно.
- **«Permission denied»** → проверьте права на `storage/` и `bootstrap/cache/`.
- **«Route not defined»** → выполните `php artisan route:clear`.

## Итоговый чек‑лист

1. `composer install`
2. `cp .env.example .env`
3. `php artisan key:generate`
4. Настроили `.env` (БД, APP_NAME и др.)
5. Создали БД/файл SQLite
6. `php artisan migrate`
7. Права на `storage/` и `bootstrap/cache/`
8. Очистили кэш (`php artisan config:clear` и др.)
9. `php artisan serve`

**Готово!** Проект должен запуститься. Если ошибка остаётся — приведите её текст, чтобы разобраться детальнее.


Проверка подключения
После запуска контейнеров проверьте подключение:

Зайдите в контейнер приложения:

bash
docker exec -it laravel_app bash
Попробуйте выполнить миграцию (проверит подключение к БД):

bash
php artisan migrate
Если миграция выполнится без ошибок — подключение настроено верно.
