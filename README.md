# Api para productos

Backend para api de productos

Copia el archivo `.env.example` a `.env` dentro de la raiz del proyecto y configura la información de la base de datos.

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=db_productos
DB_USERNAME=luis
DB_PASSWORD=lu1s
```

Despues corre lo siguiente
```
composer install
php artisan key:generate
php artisan migrate
php artisan serve
```
Puedes restaurar la base de datos dentro del archivo `docker-compose/db_init.sql`