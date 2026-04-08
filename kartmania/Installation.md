# Installation

For preparaing the enviroment is important to install this list of things

* System base dependencies

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

* Ruby version manager (RVM)
  
```bash
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB


\curl -sSL https://get.rvm.io | bash -s stable


source ~/.rvm/scripts/rvm


rvm --version
  
```

* Ruby

```bash
rvm install 3.2.8

# Establecerla como versión por defecto global
rvm use 3.2.8 --default

# Verificar la versión activa
ruby --version
```

* PostgreSQL

```bash
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Importar la clave GPG oficial de PostgreSQL
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Actualizar e instalar PostgreSQL 16
sudo apt-get update
sudo apt-get install -y postgresql-16 postgresql-client-16

# Verificar la instalación
psql --version

sudo service postgresql start

# Acceder como superusuario de postgres y crear nuestro usuario de desarrollo
sudo -u postgres psql -c "CREATE USER kartmania_user WITH PASSWORD 'kartmania_dev_2024' CREATEDB;"

# Verificar que el usuario fue creado correctamente
sudo -u postgres psql -c "\du"

sudo service postgresql status
```

* Node.js & yarn
  
```bash
sudo rm -f /etc/apt/sources.list.d/nodesource.list

# Añadir el repositorio oficial de Node.js 22 LTS
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

# Instalar Node.js 22
sudo apt-get install -y nodejs

# Verificar
node --version
# Esperado: v22.x.x

npm --version

sudo npm install -g yarn

# Verificar
yarn --version

```

* Rails

```bash

gem install rails -v '~> 7.1.0' --no-document

# Verificar la instalación
rails --version
```

## Proyect creation command

```bash
rails new kartmania \
  --database=postgresql \
  --javascript=esbuild \
  --css=bootstrap \
  --skip-test \
  --skip-jbuilder

```