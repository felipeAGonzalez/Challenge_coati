# README

* Ruby version
    2.6.3

# Instalación y uso del servidor challenge Coatí

Gemas necesarias
Escritas para el gemfile
```
gem 'paperclip'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'mysql2'
```
```bash
rails active_storage:install
```

Se agrega un usuario no root con la posibilidad de usar una nueva base de datos con los siguientes comandos

```sql
CREATE USER 'challenge_user'@'localhost' IDENTIFIED BY 'AccessPassword';

GRANT CREATE, SELECT ON * . * TO 'challenge_user'@'localhost';
```

Primeramente se realiza una actualización de los repositorios de Linux

```bash
apt-get update
apt-get upgrade
```

Antes de hacer la instalación de las gemas para el proyecto, como se manejara con mysql y con la gema `mysql2` se debería instalar la paquetería de `libmysql` con el siguiente comando

```bash
apt-get install libmysqlclient-dev
```

Lo anterior funciona principalmente para la comunicación correcta entre la gema y el cliente sql

Cuando termine de instalar se debe de instalar las gemas con el siguiente comando.

actualiza las gemas anteriormente instaladas para el funcionamiento correcto del proyecto actual si es que algunas gemas ya están instaladas

```bash
bundle update --conservative mimemagic 
```

Al no tener gemas instaladas y ser un  proyecto nuevo se ejecuta el siguiente comando 

```bash
bundle install
```

Instala las dependencias encontradas en el archivo `package.json` in en el folder local `node_modules`

```bash
yarn install --check-files
```

Al terminar podemos comenzar con el lanzamiento del servidor de producción, primeramente cambiamos el valor de la variable `config.assets.compile` de `false` a `true` esto para que todos los **assets** en la ruta `apps/assets` sean compilados y muestre los estilos y funcionen correctamente el codigo de **jquery, javascript o coffescript**

# Configuración del servidor con nginx

En la ruta `/etc/nginx/sites-available/` se crea un archivo con el nombre del sitio agregando la siguiente configuración 

```bash
server {
    listen   80;
    root /home/rails/challenge_coati/public;
    server_name _;
    index index.htm index.html;

        location ~ /.well-known {
            allow all;
        }

        location / {
        proxy_pass http://localhost:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Al terminar se debe de reiniciar el servicio de *nginx* con el siguiente comando

```bash
#para sistemas basados en debian o ubuntu server
service nginx restart
#para sistemas basados en redHat o CentOs
systemctl restart nginx
```

El archivo se encuentra en la ruta *config/environments/production.rb* 

```bash
config.assets.compile = true

#rails s -e production
```

Se ejecuta el siguiente comando para crear una base de datos, ejecutar las migraciones y correr los seeders

```bash
RAILS_ENV=production rake db:create db:migrate db:seed
```

Se ejecuta el siguiente comando para general es secret de rails

```bash
rake secret
```

Para compilar los assets y copiar las imágenes a la carpeta public

```bash
RAILS_ENV=production bundle exec rake assets:precompile
```

Para terminar corremos el servidor con el símbolo  **&** para que se mantenga ejecutando sin necesidad de tener abierta la terminal

```bash
RAILS_ENV=production rails s &
```

# Notas relacionadas

Para el reinicio del servidor de rails sin necesidad de terminarlo se usa el siguiente comando

```bash
rails restart
```

Para apagar el servidor de rails en caso de necesitarlo se ubica el archivo *server.pid* en la siguiente ruta `your_project_path/tmp/pids/server.pid` con el numero de proceso se ejecuta el comando a continuación

```bash
kill *procces_number*
```

* Configuration

* Database creation
```bash
    rails db:create
```