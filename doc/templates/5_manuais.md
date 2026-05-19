# Manuais


## Manual técnico do proxecto

Tras unha investigar a compatibilidade entre as versións das distintas tecnoloxías 
decididas para a realización da aplicación, estas foron as versións elexidas:

| Tecnología | Versión | Motivo |
|---|---|---|
| Ruby | 3.2.8 | Estable, compatible con Rails 7.1 |
| Rails | 7.1.6 | LTS, soporte Hotwire/Turbo |
| PostgreSQL | 16.x | Compatible con Railway, e moi popular e fiable |
| Node.js | 22 LTS | Soporte hasta abril 2027 |
| Yarn | 1.22.22 | Compatible con jsbundling-rails |
| CSS | Bootstrap 5.3.8 | Componentes listos, ideal para gestión |


### Instalación

Para a instalación do entorno local de este proxecto é necesario
seguir os seguintes pasos:

1. Instalar as dependecias bases do sistema
```bash
sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y \
  curl \
  gnupg2 \
  git \
  build-essential \
  libssl-dev \
  libreadline-dev \
  zlib1g-dev \
  libpq-dev \
  libsqlite3-dev \
  libyaml-dev \
  libxml2-dev \
  libxslt1-dev \
  software-properties-common \
  ca-certificates \
  wget \
  autoconf \
  bison \
  patch \
  rustc \
  libgmp-dev \
  libgdbm-dev \
  libncurses5-dev \
  libffi-dev
```

2. Instalar RVM (Ruby Version Manager)

Para buscar as claves GPG: [RVM GPG Keys](https://rvm.io/rvm/security#install-our-keys)

```bash
# Importar claves GPG de RVM
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Instalar RVM stable
\curl -sSL https://get.rvm.io | bash -s stable

# Recargar la terminal o
# Cargar RVM en la sesión actual
source ~/.rvm/scripts/rvm 

rvm --version

```
3. Instalar Ruby con RVM
   
```bash
# Instalar Ruby 3.2.8
rvm install 3.2.8

# Establecer como versión por defecto
rvm use 3.2.8 --default

# Verificar versiones de ruby y gem
ruby --version
gem --version

```

4. Instalar PostgreSQL

```bash
# Añadir repositorio oficial de PostgreSQL
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Importar clave GPG
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Instalar PostgreSQL 16
sudo apt-get update
sudo apt-get install -y postgresql-16 postgresql-client-16

# Iniciar el servicio
sudo service postgresql start

# Crear usuario de desarrollo
sudo -u postgres psql -c "CREATE USER user_name WITH PASSWORD 'password' CREATEDB;"

# Verificar usuario creado
sudo -u postgres psql -c "\du"
```

5. Instalar Node.js
   
```bash
# Añadir repositorio Node.js 22 LTS
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

# Instalar Node.js 22
sudo apt-get install -y nodejs

# Verificar versiones de npm y node
node --version
npm --version
```

6. Instalar yarn

```bash
# Instalar Yarn globalmente vía npm
sudo npm install -g yarn

yarn --version

```

7. Instalar Rails
```bash
# Instalar Rails 
gem install rails -v '~> 7.1.0' --no-document

rails --version

```

En el momento de la creación del proyecto se utilizo el siguiente comando,
pero para seguir trabajando en el no se tiene que ejecutar:

```bash
rails new kartmania \
  --database=postgresql \
  --javascript=esbuild \
  --css=bootstrap \
  --skip-test \
  --skip-jbuilder

```

Cada vez que se quiera seguir trabajando en el proyecto se recomienda 
seguir los siguiente pasos:

```bash

# Hacer un pull antes de editar
git pull

# Recargar Gemfile para estar al día en la sesión
bundle install
yarn install

# verificar migraciones
rails db:migrate

```

## Melloras futuras

De cara ao futuro xa hai unhas cuantas ideas pensadas para esta aplicación, xa que a empresa gustarialle
empezar a utilizar esta aplicación como unha vía de ingresos.

Algunhas das ideas son:

* Implementar unha pasarela de pago para que os cliente poidan pagar as reservas ao momento de facelas
e non ter que pagar de maneira presencial
* Aproveitar a pasarela para crear unha tienda online na que vender o merchandising da empresa (camisetas, gorras...)
* Levar a outro nivel a presentación visual da páxina web para os clientes.
* A creación de un foro no que os clientes poidan chatear con nos e cos outros clientes
* Crear un apartado para as estadisticas dos nosos clientes
