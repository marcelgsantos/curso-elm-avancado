# [Elm Beyond The Basics](http://courses.knowthen.com/courses/elm-beyond-the-basics)

## [01 - Introduction](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1772951)

* É importante entender como desenvolver **aplicações grandes** em Elm.
* Aplicações simples em Elm podem ser feitas em **apenas um módulo**.
* O Elm fornece uma excelente maneira de se **organizar uma aplicação** ao utilizar a arquitetura Elm.
* A biblioteca `elm-lang/navigation` fornece funcionalidades de **roteamento** para a construção de *single page apps* em Elm.
* Elm é uma linguagem de programação **funcional** e utiliza **funções puras**.
* Porém, ao se **comunicar** com o servidor via HTTP e WebSockets, se faz necessário utilizar **funções impuras**.
* É importante entender como se trabalha com **JSON** em Elm.
* É possível (e útil) realizar a **comunicação** entre partes de uma aplicação escrita em JavaScript e Elm.

## [02 - Review](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1772953)

* Uma **aplicação Elm** é composta por *model*, *update* e *view*.
* Uma **aplicação trivial** possui *apenas um arquivo*, *alguns campos* e *algumas interações*.

## [03 - The Elm Architecture - Overview](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1772954)

* Recomenda-se organizar uma aplicação Elm em diversos **módulos** ou **componentes**.
* O **módulo principal** é responsável por orquestrar toda a aplicação.
* O módulo principal, apesar de incluir várias models, ele desconhece o **funcionamento interno** de cada uma delas. O mesmo acontece para as *messages* e para as *views*.
* O módulo principal ou *main* é o ***entrypoint*** para a aplicação e responsável por gerenciar os **módulos menores** sem a necessidade de **conhecer as implementações**.
* Esse **baixo acoplamento** permite que alterações sejam feitas nos módulos sem a necessidade de alterações em outros lugares.
* A **arquitetura Elm** influenciou várias outras bibliotecas.

## [04 - The Elm Architecture - Example](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1463699)

* Ao definir um **módulo**, ele deve ter o mesmo nome do arquivo. Por exemplo, `module Login exposing (..)` deve fazer parte do arquivo `Login.elm`.
* A utilização de `(..)` faz com que todas as **funções** e **tipos** disponíveis no módulo sejam **vísiveis** e **utilizáveis** em todos os arquivos que importam esse módulo.
* Uma *model* de um módulo pode ser referenciado em outro módulo utilizando a notação `MyModule.Model`.
* O mesmo acontece para outras estruturas como **funções** ou **tipos**.
* Todas as interações relacionadas à um módulo específico devem ser gerenciadas pelo próprio módulo, e não pelo módulo pai.
* Ao chamar a view do módulo interno, devemos tomar cuidado para não passar uma mensagem da view externa, que são incompatíveis.
* Recomenda-se utilizar a função `App.map` para realizar o mapeamento entre tipos para que a view do módulo interno seja chamada com a assinatura de tipos correta.
* Deve ser analisada a viabilidade de se utilizar a **arquitetura Elm**.

## [05 - Effects - Overview](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1772952)

* Um **efeito** pode ser uma *requisição assíncrona*, uma *conexão por WebSocket* ou *salvar informações* no LocalStorage.
* Um **efeito** pode ser descrito em como o Elm se comunica com o mundo fora dele.
* Em Elm utiliza-se **dados imutáveis** e **funcões puras**.
* As **funções puras** são melhores que as **funções impuras** pois são *fáceis de testar*, *componíveis* e *cacheáveis*.
* Nós podemos escrever funções puras, mas precisamos de funções impuras.
* A **manipulação de efeitos** é como **gerenciar estados** na aplicação.
* Em uma aplicação Elm se escreve apenas **funções puras**, a responsabilidade de **gerenciar estados** é do `Html.App`.
* Em Elm utiliza-se **comandos** para a **manipulação de estados**.
* Um **comando** delega o que deve ser feito para outra função. Isso permite manter a **função pura**, pois ela só retorna dados.
* Outra função pode **receber o comando** e **agir sobre ele**, ou seja, realizar coisas impuras.
* A função `update` de uma aplicação Elm **dispara um comando** (Command e dados) para uma biblioteca executar e ver se houve sucesso ou não e, por fim, responder para a função `update`.

## [06 - Effects - Example (Chuck Norris Joke App)](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1772955)

* Para fazer uma requisição HTTP devemos utilizar **comandos** (que são apenas dados) que são enviados para um lugar onde os efeitos podem ocorrer.
* Para isso, devemos saber como **criar um comando** e para onde **enviar o comando**.
* Para fazer **requisições HTTP** deve-se utilizar o pacote `elm-lang/http` e importar o módulo `Http`.
* Devemos criar uma constante que é um **comando** que pode **gerar mensagens**. Por exemplo, `randomJoke: Cmd Msg`.
* Assim como o tipo `Html`, o tipo `Cmd` é capaz de **gerar mensagens**.
* A função `getString` do módulo `Http` recebe uma `String`, ou seja, a **url para consulta** e retorna uma `Request` do tipo `String`.
* Uma `Request` é um ***alias type*** que descreve uma **requisição HTTP**.
* Utiliza-se **mensagens** para comunicar um erro ou sucesso em uma **requisição HTTP**.
* Para transformar erros e/ou sucesso de uma requisição HTTP, devemos **transformar** uma **requisição** em um **comando** utilizando a função `Http.send`.
* A função `Http.send` recebe dois parâmetros (1) uma função que recebe um `Result` e retorna uma mensagem que a aplicação compreende e (2) uma `Request` e retorna um **comando** ou `Cmd`.
* Um **comando** é uma **estrutura de dados** que contém (1) uma **requisição** que poderá falhar ou ter sucesso e (2) **mensagens** específicas da aplicação utilizadas para a comunicação de sucesso ou falha de volta para a aplicação.
* Um **comando** é apenas dados que (1) descrevem o que queremos fazer e (2) como lidar com possíveis resultados.
* Um **comando** não será executado se ele não for passado para algo que possa executá-lo.
* Para utilizar **comandos** deve-se utilizar a função `Html.program` ou invés da função  `Html.beginnerProgram`.
* A função `App.program` deve ser utilizada em aplicações que utilizam **comandos**.
* A função `App.program` recebe um registro que possui os seguintes campos:
    * `init` - recebe uma tupla com a **model inicial** e um ou mais **comandos** que podem ser executados no carregamento inicial da aplicação. Por exemplo, `(model, Cmd msg)`.
    * `update` - recebe uma função que deve retornar uma tupla com a **model modificada** e um ou mais **comandos** que podem ser executados na aplicação. Por exemplo, `(model, Cmd msg)`.
    * `subscriptions` - recebe uma função que deve receber como parâmetro uma model e retorna uma `Sub` capaz de gerar mensagens.
    * `view` - a função `view` é responsável pela **representação visual** da aplicação.
* Podemos utilizar a função `Cmd.none` quando precisarmos retornar um comando, mas sem a necessidade de ser executado.
* Podemos utilizar a função `Sub.none` quando precisarmos retornar um subscription.
