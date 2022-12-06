# MOVIES APP

## Ideia do aplicativo
Criar um aplicativo para apresentar os principais drinks do mercado.

## Principais Tecnologias
* Swift e UIKit
* Gerenciador de dependências:  Cocoapods
* Requisições para API de Drinks
* SDWebImage para baixar imagens de forma assíncrona e cache em memória.

## Como rodar
* Abrir o terminal e rodar o comando pod Install no diretório do projeto 
* Utilizar o Xcode para abrir o arquivo DrinkApp.xcodeproj

## Sobre o aplicativo
* O aplicativo possui 3 telas principais: 

* Tela de Home: 
    * Em uma TableView, listamos os drinks da API thecocktaildb;
    * Utilizando uma CollectionView, criamos um trilho de letras para selecionar os drinks que começam com a letra desejada;
    * Utilizando um Searchbar, o usuário pode buscar o drink desejado;
    * Utilizando a dependência do SDWebImage para carregar as imagens das células da TableView de forma assíncrona.
    * Detectamos o clique do usuário para abrir uma Tela de Detalhe do Drink. 

* Tela de Favoritos:
    * Em uma CollectionView, apresentamos os drinks favoritados pelo usuário.
    * Criamos uma classe chamada DrinkStorage quem tem a responsabilidade em armazenar e entregar itens persistidos no UserDefault.
    * Detectamos o clique do usuário para abrir uma Tela de Detalhe do Drink

* Tela de Detalhes: 
    * Em uma TableView, apresentamos as informações básicas do drink. Na primeira célula, utilizamos a dependência do SDWebImage para carregar a imagem, na segunda célula, apresentamos o título, na terceira apresentamos os ingredientes e na última, apresentamos as informações sobre o modo de preparo do drink. 

* Implementamos uma TabBar como estrutura central do aplicativo para acessar a Tela de Home e a Tela de Favoritos.

* Trabalhamos com completion e delegate para treinar diferentes maneiras de transporte de dados no aplicativo.

* Utilizamos a URLRequest para fazer a requisição dos dados 

* Também utilizei esse projeto para iniciar meu aprendizado sobre arquitetura VIPER na classe da Home. 
