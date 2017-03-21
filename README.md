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
