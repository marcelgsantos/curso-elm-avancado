# [Elm Beyond The Basics](http://courses.knowthen.com/courses/elm-beyond-the-basics)

## [01 - Introduction](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1463609)

* É importante entender como desenvolver **aplicações grandes** em Elm.
* Aplicações simples em Elm podem ser feitas em **apenas um módulo**.
* O Elm fornece uma excelente maneira de se **organizar uma aplicação** ao utilizar a arquitetura Elm.
* A biblioteca `elm-lang/navigation` fornece funcionalidades de **roteamento** para a construção de *single page apps* em Elm.
* Elm é uma linguagem de programação **funcional** e utiliza **funções puras**.
* Porém, ao se **comunicar** com o servidor via HTTP e WebSockets, se faz necessário utilizar **funções impuras**.
* É importante entender como se trabalha com **JSON** em Elm.
* É possível (e útil) realizar a **comunicação** entre partes de uma aplicação escrita em JavaScript e Elm.

## [02 - Review](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1463632)

* Uma **aplicação Elm** é composta por *model*, *update* e *view*.
* Uma **aplicação trivial** possui *apenas um arquivo*, *alguns campos* e *algumas interações*.

## [03 - The Elm Architecture - Overview](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1463685)

* Recomenda-se organizar uma aplicação Elm em diversos **módulos** ou **componentes**.
* O **módulo principal** é responsável por orquestrar toda a aplicação.
* O módulo principal, apesar de incluir várias models, ele desconhece o **funcionamento interno** de cada uma delas. O mesmo acontece para as *messages* e para as *views*.
* O módulo principal ou *main* é o ***entrypoint*** para a aplicação e responsável por gerenciar os **módulos menores** sem a necessidade de **conhecer as implementações**.
* Esse **baixo acoplamento** permite que alterações sejam feitas nos módulos sem a necessidade de alterações em outros lugares.
* A **arquitetura Elm** influenciou várias outras bibliotecas.
