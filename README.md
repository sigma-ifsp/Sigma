Sigma
=====

Um serviço de fidelização que funciona.

## Repositório

Este projeto usa git e está hospedado no Github.
Acesse: [https://github.com/sigma-ifsp/Sigma](https://github.com/sigma-ifsp/Sigma)

Ou clone o projeto:

```
git clone git@github.com:sigma-ifsp/Sigma.git
```

## Instalação

A instalação do projeto requer algumas dependências:

- git >= 1.7
- ruby >= 1.9.3
- sqlite3 >= 3.7
- bundler(ruby gem) >= 1.1

Você precisará de permissões para instalar ruby gems.
Após as dependências forem satisfeitas, será preciso
instalar as bibliotecas ruby.
Para isso, acesse o diretório do projeto pelo seu terminal shell e execute:

```
bundle install
```

Em seguida será preciso configurar o banco de dados.
Edite o arquivo `config/database.yml` com suas informações, se necessário.

Após a configuração de banco de dados, é preciso criar as bases de dados.
Execute:
```
rake db:create:all
```

E em seguida:
```
rake db:migrate
```

## Executando testes

Para executar os testes, você precisará preparar seu banco de testes.
Será preciso fazer somente após criar alguma `migration`.

```
rake db:test:load
```

Em seguida, execute os testes:

```
rake test
```
