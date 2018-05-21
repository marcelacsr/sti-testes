Essa é uma aplicação criada a partir do livro [*Learn Web Development with Rails*](http://www.railstutorial.org/) by [Michael Hartl](http://www.michaelhartl.com/).
All source code in the [Ruby on Rails Tutorial](http://railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[LICENSE.md](LICENSE.md) for details.

#### Getting started

Utilizei a aplicação como base para criação de testes. 
Utilizando[*Rspec*](http://rspec.info/) e [*GitHub*](https://github.com/rspec/rspec-rails)


Para começar,  clone o repositório:
```
$ git clone 
```
rvm:
```
$ rvm use 2.4.1
```
Depois, rode um desses comandos (sintaxe diferente para comandos equivalentes)

```
$ bundle install
$ bundler
$ bundle
```
Para criar o diretório do spec/(onde os arquivos de testes deverão ficar,
juntamente com os arquivos gerados: spec/rails_helper.rb e spec_helper.rb)
rode o seguinte comando:
```
rails generate rspec:install
```
No MySql os bancos: sampleapp_development e sampleapp_test criados.
O arquivo database.yml deve está configurado. Exemplo:
```
development:
  adapter: mysql2
  encoding: utf8
  database: sampleapp_development
  username: seuusername
  password: suasenha

test: &test
  adapter: mysql2
  encoding: utf8
  database: sampleapp_test
  username: seuusername
  password: suasenha
```

Drop database:
```
$ rails db:drop
```
Create database:
```
$ rails db:create
```
Migrate database:
```
$ rails db:migrate
```
Seed database:
```
$ rails db:seed
```

#####Welcome to the Sample App Tests 
Finally, run the tests to verify that everything is working correctly:
```
$ rake spec 
```
Para rodar todos os testes de modelos:
```
$ rake spec/models 
```
Para rodar testes de um modelo específico:
```
$ rake spec/models/nome_do_modelo.rb 
```
#####Welcome to the Sample App
If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```


/marcelacsr
 