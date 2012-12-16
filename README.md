Sigma
=====

Este documento contém o manual técnico do projeto.

## Repositório

Este projeto usa git e está hospedado no Github.
Acesse: [https://github.com/sigma-ifsp/Sigma](https://github.com/sigma-ifsp/Sigma)

Ou clone o projeto:

```
git clone git@github.com:sigma-ifsp/Sigma.git
```

## Instalação

A instalação do projeto em ambiente de desenvolvimento e testes requer algumas dependências:

- Sistema Operacional Fedora 16 ou superior
- Git, versão 1.7 ou superior
- Curl, versão 7.21 ou superior
- RVM, versão 1.10 ou superior
- Ruby, versão 1.9.3 ou superior(instalado a partir do RVM)
- MySQL Server, versão 5.5 ou superior com seus pacotes de desenvolvimento(mysql-devel no Cent OS)
- bundler(rubygem), versão 1.1
- GCC versão 4.6 ou superior

### Instalando pacotes do sistema

Como usuário root, você deverá executar:
```
# yum install -y git curl mysql-server mysql-devel gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison
```

### Instalando RVM e Ruby

A instalação do RVM(Ruby Version Mananger) é bem simples.
É possível instalar para um único usuário ou multi-usuário.
Para maiores informações, veja na [documentação do RVM](https://rvm.io/rvm/install/).
Nós usamos a instalação single-user.

Execute:

```
$ curl -L https://get.rvm.io | bash -s stable --ruby
```

Após isso, recarregue sua sessão shell(neste caso, bash):

```
$ source ~/.bashrc
```

O próximo passo é instalar o Ruby, versão 1.9.3. Para isso,
execute:

```
$ rvm install ruby-1.9.3
```

### Instalando bibliotecas do projeto

Após as dependências forem satisfeitas, será preciso
instalar as bibliotecas ruby.
Para isso, acesse o diretório do projeto pelo seu terminal shell e execute:

```
$ gem install bundler
$ bundle install
```

### Configurando o projeto

Em seguida será preciso configurar o banco de dados.
Edite o arquivo `config/database.yml` com informações de acesso
ao banco de dados. Para cada ambiente será criado uma base.
Por padrão, trabalhamos com três ambientes: produção, teste e desenvolvimento.

Após a configuração de banco de dados, é preciso criar as bases de dados.

Execute:
```
bundle exec rake db:create:all
```

E em seguida:
```
bundle exec rake db:migrate
```

## Instalação em ambiente de produção

A instalação em produção contém algumas diferenças
fundamentais, que são: a ausência do RVM e a presença do servidor web Nginx.

Além dessas diferenças, temos configurações específicas para o servidor
de aplicação e servidor de assets(arquivos estáticos como imagens e folhas de estilo).

### Plataforma

A instalação deve ser feita na plataforma Linux CentOS versão 5 ou superior.

### Dependências

Em produção será necessário instalar:

- Servidor Web "nginx", versão 1.0 ou superior;
- Ruby versão 1.9.3 ou superior;
- MySQL Server(mysql-server) 5.5 ou superior;
- MySQL Devel(mysql-devel) 5.0 ou superior;
- GCC 4.1 ou superior;

### Instalando dependências

#### Pacotes do sistema

Os pacotes do sistema são os mesmos usados em desenvolvimento.
Alguns pacotes como o Git não estão no repositório padrão do Cent OS.
Será preciso instalar o EPEL(Extra packages for Enterprise Linux).
Para isso, siga o tutorial [Pacotes Extras para Enterprise Linux](http://philipsampaio.com.br/blog/2012/01/14/pacotes-extras-para-enterprise-linux/).

#### Ruby

Para instalar a versão mais recente do Ruby, e preciso obtê-lo e compilá-lo.
Para isso, execute os comandos:

```
$ cd /tmp/
$ wget -c http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.gz
$ tar -xvzf ruby-1.9.3-p286.tar.gz
$ cd ruby-1.9.3-p286/
$ ./configure
$ make
# make install
```

#### Servidor Nginx

A instalação do servidor Nginx também requer compilação.
Siga os comandos:

```
$ cd /tmp/
$ wget -c http://nginx.org/download/nginx-1.0.5.tar.gz
$ tar xfz nginx-1.0.5.tar.gz 
$ cd nginx-1.0.5
$ ./configure --prefix=/opt/nginx --user=nginx --group=nginx --with-http_ssl_module
$ make
# make install
# /usr/sbin/useradd -M -r --shell /sbin/nologin --home-dir /opt/nginx nginx # Cria usuário para servidor
# wget -O init-rpm.sh http://library.linode.com/assets/662-init-rpm.sh # Script de inicialização
# mv init-rpm.sh /etc/rc.d/init.d/nginx
# chmod +x /etc/rc.d/init.d/nginx # Script de inicalização precisa de permissão de execução
# /sbin/chkconfig --add nginx # Adiciona script de inicalização ao sistema
# /sbin/chkconfig --level 2345 nginx on # Habilita inicialização em níveis 2,3,4 e 5(runlevel)
```

### Configurando servidor

#### MySQL Server

Após a instalação do servidor MySQL, será preciso indicar uma senha para o usuário
root. 

Para isso, inicie o serviço e a configuração segura do MySQL:

```
$ /etc/init.d/mysqld start
$ /usr/bin/mysql_secure_installation
```

Após configurar o MySQL, será necessário criar a base de dados do projeto Sigma
e configurar o arquivo `database.yml`. Na sessão "Configurando Deploy", este
processo será explicado mais detalhadamente.

### Configurando para deploy

O processo de deploy(lançamento de nova versão) é feito através da gem Capistrano.
Para que seja realizado, o usuário que faz o deploy deverá ter acesso à máquina
de produção via SSH. Todo o processo de deploy é comandado da máquina remota, não
sendo necessário o acesso direto à máquina de produção.

As configurações de deploy podem ser conferidas no arquivo `config/deploy.rb`, 
na raíz do projeto.

Em seguida, será necessário criar os diretórios.

Para isso, siga os passos:

```
$ bundle exec cap deploy:setup 
```

Após este passo, será necessário configurar o arquivo de conexões de banco de dados.
Você deverá acessar a máquina de produção neste passo.

Crie um arquivo com o nome `database.yml` para configuração do seu banco de dados.
Ele deverá ser salvo no diretório `shared` do diretório de deploy(variável deploy_to do arquivo 
de configuração de deploy).
O arquivo contém o seguinte formato(importante a indentação de 2 espaços):

```
production:
  adapter: mysql2
  database: sigma_production
  user: root
  password:
  pool: 5
  timeout: 5000
```
Após configurar o banco de dados, você poderá realizar o primeiro deploy:

```
$ bundle exec cap deploy:cold
```

A primeira versão deverá estar em execução.
Após isso, todo o deploy deverá ser feito com o comando:

```
$ bundle exec cap deploy
```

Para saber mais comandos do Capistrano, execute:

```
$ bundle exec cap -T
```


## Testes

Para executar os testes, você precisará preparar seu banco de testes.
Será preciso fazer somente após criar alguma migração, ou em uma nova instalação.

```
rake db:test:load
```

Em seguida, execute os testes:

```
rake test
```

### Cobertura de testes

Após rodar os testes com `rake test`, a ferramenta Simplecov irá gerar um relatório
de cobertura de testes no diretório `coverage/`, na raíz da aplicação.
Você poderá abri-lo com o google-chrome:

```
$ google-chrome coverage/index.html
```

## Executando aplicação

Para rodar a aplicação, execute:

```
rails server
```

E acesse seu navegador em http://localhost:3000
Por padrão, o Rails escutará a porta 3000 em qualquer interface.

## Gerando documentação

A documentação de código pode ser gerada com o comando:

```
rake doc:app
```

Será criado no diretório `doc/` um website estático contendo
a documentação(gerado com RDoc).

## Versionamento

Para versionamento, foi utilizado o [Git](http://git-scm.com/), e a hospedagem foi feita
através do [Github](https://github.com/).
A equipe decidiu utilizar o Git por já conhecer o software e por ele possibilitar
maior flexibilidade quando usado em conjunto com Ruby e Rails.

O modelo de desenvolvimento utilizado foi o "feature-branch", onde cada nova
funcionalidade é isolada em um *branch*, que é uma ramificação do software.

Exemplo:

Temos a funcionalidade de autenticação, então criamos um branch com nome "authentication":
```
$ git checkout -b authentication
```

Todo o trabalho é feito neste *branch*, e então ele será unido ao *master*:
```
$ git checkout master
$ git merge authentication
```

O conceito de branch é muito similar ao do Subversion. É possível manter versões
de desenvolvimento em diferentes *branchs*, e então depois uni-los com o *branch*
principal. No caso do git, o *branch* principal é denominado *master*(no Subversion ele é o trunk).

O fato do Git ser descentralizado possibilita a criação de *branchs* locais, sem precisar
disponibilizá-los no repositório "central".

Alguns conceitos acabaram não sendo utilizados, como as *tags*
que marcam versões nomeadas(por exemplo, 0.1).

### Sincronização com Subversion

A utilização de repositórios externos foi autorizada pelos professores,
desde que fosse sincronizado com o Subversion instalado nos servidores do IFSP.

O Git possui uma ferramenta que possibilita essa sincronização. A ferramenta denominada
"Git-SVN" torna possível a utilização de repositórios git em conjunto com repositórios SVN.

Para que seja sincronizado, deverá ser utilizado os seguintes passos:

Fazer uma nova cópia do projeto completo no diretório Sigma:
```
$ git-svn clone https://fw.lab.sp.cefetsp.br/svn/a6pgp/S201202/Sigma/ --username prontuário 

```

Criar um branch para desenvolvimento:
```
$ git checkout -b novo_branch
```

Depois de desenvolver a nova funcionalidade, deve-se atualizar o repositório Subversion.
Um detalhe ruim é que o repositório Subversion armazenará os commits com o nome do
autor que fizer a sincronização.
Para sincronizar, faça o *merge* com o master e atualize o repositório:
```
$ git checkout master # Vai para o master
$ git merge novo_branch
$ git-svn dcommit
$ git-svn rebase
```

Para manter uma outra cópia do projeto em algum repositório git remoto, adicione
uma referência no git:

```
$ git remote add origin git@github.com:sigma-ifsp/Sigma.git
```

Quando os desenvolvedores clonarem o projeto a partir do repositório Git, as
referências do repositório remoto já estarão definidas.
```
$ git clone git@github.com:sigma-ifsp/Sigma.git
```
