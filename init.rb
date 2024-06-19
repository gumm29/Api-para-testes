require 'sinatra'
require 'json'

livros = []

class Livro
    @contador = 0

    def initialize(contador, titulo, texto)
        @titulo = titulo
        @texto = texto
        @id = contador
    end

    def titulo
        @titulo
    end

    def texto
        @texto
    end

    def self.gerar_numero
        @contador += 1
    end

    def json
        json = {}
        json[:id] = @id
        json[:titulo] = @titulo
        json[:texto] = @texto
        json
    end
end

livro =  Livro.new(Livro.gerar_numero, 'revolucao dos bichos', 'va ler')

puts livro.json


get '/livros' do
    livros.to_json
end

get '/livro/:id' do |id|
    livro_encontrado = []
    livros.each do |livro|
        if livro[:id] == id.to_i
            livro_encontrado << livro
        end
    end

    livro_encontrado.empty? ?  (status 404) : livro_encontrado.to_json
end

post '/livro' do
    data = JSON.parse(request.body.read)
    livro = Livro.new(Livro.gerar_numero, data['titulo'], data['texto']).json
    livros << livro
    status 201
end

put '/livro/:id' do |id|
    data = JSON.parse(request.body.read)
    puts data['titulo']
    livro_editado = []
    livros.each do |livro|
        if livro[:id] == id.to_i
            livro[:titulo] = data['titulo']
            livro[:texto] = data['texto']
            livro_editado << livro
        end
    end
    livro_editado.empty? ?  (status 404) : livro_editado[0].to_json
end

delete '/livro/:id' do |id|
    livro_deletado = false
    livros.each do |livro|
        if livro[:id] == id.to_i
            livros.delete(livro)
            livro_deletado = true
        end
    end
    livro_deletado ?  (status 200) : (status 404)
end


