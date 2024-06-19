## Api para testes

### Rodar o comando
````
ruby init.rb
````

### Segue como testar 
### POST
#### posta livro
http://127.0.0.1:4567/livro

Body raw (json)
{
    "titulo": "revolucao dos bichos",
    "texto": "va ler"
}

### GET
#### retorna todos livros
http://127.0.0.1:4567/livros

### GET
#### retorna livro :id
http://127.0.0.1:4567/livro/2

### DELETE
#### apaga livro :id
http://127.0.0.1:4567/livro/2

### PUT
#### edita livro :id
http://127.0.0.1:4567/livro/2

Body raw (json)
{
    "titulo": "revolucao dos besta",
    "texto": "va ver"
}