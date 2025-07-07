# NGINX Mirror Proxy (HTTPS)

Этот проект запускает зеркало сайта с помощью Docker, nginx и Let's Encrypt.
Используется `nginx-proxy` для автоматической маршрутизации и `acme-companion` для получения SSL-сертификатов.

## Состав

- `nginx-proxy`: принимает трафик по HTTPS
- `acme-companion`: автоматически получает SSL-сертификаты
- `mirror`: nginx-контейнер, проксирующий внешний сайт

## Настройка

1. Создайте A-запись поддомена (например, `ru4.example.com`) и направьте её на IP вашего сервера.
2. Отредактируйте `.env` и `default.conf` файлы:

DOMAIN=ru4.example.com		- откуда
EMAIL=you@example.com		- для SSL
UPSTREAM=https://example.com	- куда

3. Убедитесь, что порты 80 и 443 открыты.

## Запуск

docker compose --env-file .env up -d

## Проверка

curl -I https://ru4.example.com

## Остановка и очистка

docker compose down -v
