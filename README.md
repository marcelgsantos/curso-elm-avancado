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

## [07 - JSON (Decoding JSON -> Elm)](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1772959)

* A decodificação de um JSON em JavaScript pode ser feita de **maneira simples** utilizando a função `JSON.parse` e, através da notação de ponto `.`, acessar as propriedades do objeto retornado.
* Dado que o Elm é uma *linguagem estática* e *fortemente tipada*, é necessário de um pouco mais de trabalho para a **decodificação de um JSON**. Porém, apesar de trabalhoso, é fácil realizar a decodificação.
* É necessário manter **forte** e **segura** a garantia que o Elm fornece.
* Decodificar um JSON é simplesmente *descrever* as **propriedades esperadas** e quais *tipos pertencem*.
* Se um JSON contém as **propriedades** e **valores esperados**, ele é *transformado em um valor* do Elm. Porém, se não possui o formato esperado, *obtém-se um erro*.
* Utiliza-se um **decoder** para realizar a decodificação de um JSON em Elm.
* Para **criar um decoder** é necessário importar o módulo `Json.Decode`.
* A anotação de tipos `decoder : Decoder String` refere-se a criação de um **decoder de strings**, ou seja, que permite decodificar um JSON em uma string.
* A função `at` permite *acessar um campo aninhado* de um JSON e **decodificá-lo** para um tipo específico.
* A função `at` recebe **uma lista** com o *caminho para o campo* a ser acessado e **um decoder** para um *tipo específico*. Por exemplo, `at [ "user", "email" ] string`.
* Para **realizar a decodificação** utiliza-se a função `decodeString` que recebe um **decoder** como *primeiro argumento* e uma **string à ser decodificada** como *segundo argumento*.
* O **retorno de uma decodificação** é um `Result` que pode ser um `Err` ou `Ok`.
* Pode-se *realizar o decoder* de um JSON de uma maneira **mais simples** através da função `Http.get` que **recebe um decoder** como argumento.
* Neste caso, o **passo de decode** é realizado pela função `Http.get`. Por exemplo, `Http.get url (at [ "user", "email" ] string)`.
* Em **aplicações reais** costuma-se utilizar JSONs **mais complexos** para representar um registro, por exemplo.
* Para realizar o decode de **três valores** de um JSON para um **tipo específico** utiliza-se a função `map3`.
* A função `map3` recebe *quatro parâmetros*. O primeiro é a **função** ou **construtor de tipo** responsável por criar um **valor do tipo especificado** e os outros *três parâmetros* são os **decoders** para cada um dos valores.
* Em `map3 Person (field "id" int) (field "name" string) (field "age" int)` é realizada a **decodificação de um JSON** no formato `{id: 1, name: "John", age: 25}` para um tipo Person no Elm.
* Pode-se utilizar a biblioteca `elm-decode-pipeline` para a decodificação de JSON de uma **maneira mais fácil** e com **algumas facilidades** como caso o JSON *tenha um campo opcional* ou *não tenha um formato pré-definido*.
* Para **instalar a biblioteca** utilize o comando `elm package install NoRedInk/elm-decode-pipeline`.
* Pode-se utilizar as funções `required` e `optional` da biblioteca `elm-decode-pipeline` para decodificar um campo de forma **obrigatória** e **opcional**.

## [08 - Websockets (Time Streaming Example App)](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1772957)

* Os **websockets** são um padrão para o *estabelecimento* e *manutenção* de uma **conexão com o servidor** permitindo que navegador e servidor *enviem mensagens* entre si.
* A função `listen` é utilizada para **iniciar a conexão** do websocket com o servidor.
* Ela recebe dois argumentos: a **url** para *conectar ao servidor* e uma **função** que *recebe uma string* e *retorna uma subscription* capaz de gerar mensagens.
* Utiliza-se o comando `elm package install elm-lang/websocket` para **instalar o pacote** de websocket.
* Uma ***subscription*** é uma forma **registrar o interesse** em algo e **ser notificado** se esse algo acontecer. Por exemplo, o interesse em ser notificado por *mensagens enviadas pelo servidor*.
* As ***subscriptions*** podem ser utilizadas de várias formas no Elm.
* A função `send` recebe dois argumentos: a **url** para conectar ao servidor e a **mensagem** à ser enviada.
* Pode-se utilizar a aba Network do Developer Tools para **analisar a conexão** realizada via websocket.
* É recomendável **terminar a conexão** com o websocket caso o seu uso não seja mais necessário.
* A função `subscription` é chamada toda vez que a função update é chamada.
* Ao retornar `Sub.none` da função `subscription` a **conexão é fechada** com o websocket. Isso acontece pois é informado que não existe mais o interesse em ouvir o servidor.
* Encerrar a conexão com o servidor permite evitar a **utilização desnecessária** de recursos do servidor.

## [09 - Navigation (Single Page App Routing)](http://courses.knowthen.com/courses/elm-beyond-the-basics/lectures/1772958)

* A navegação sem **atualizar url** possui os contras de *não ser possível favoritar a página* e *não se possível compartilhar a url*.
* O Elm possui o pacote `Navigation` que permite a **manipulação de urls**.
* Sugere-se pensar na **barra de endereço** do navegador como um *campo de texto*.
* A **aplicação** pode *ver as alterações* e *fazer alterações* na barra de endereço do navegador.
* O módulo `Navigation` possui a função `program` (semelhante a função `Html.program`).
* A função `Navigation.program` recebe uma função que recebe uma `Location` e retorna uma mensagem caso a **url seja alterada**.
* É uma forma de transformar a **alteração da url** em uma **mensagem da aplicação** e a aplicação mudar de página.
* O campo `init` de `program` também deve ser alterado. Ele passa a receber `Location` e retorna `( Model, Cmd Msg )`.
* A alteração em `init` é necessária para que a aplicação seja **carregada na página correta** ao ser iniciada de acordo com a url.
* Utiliza-se o comando `elm package install elm-lang/navigation` para **instalar o pacote** `Navigation`.
* A função recebida por `Navigation.program` recebe `Location`, *inspeciona a url* e, baseado na url, *notifica a aplicação* **através de uma mensagem**.
* A mensagem `Navigate` é gerada quando se **clica manualmente** no link. Neste caso, a *página é alterada* mas a *url não*.
* Neste caso, recomenda-se gerar um **comando** que *muda a url*.
* Utiliza-se a função `newUrl` para *gerar um comando* que **muda a url** e adiciona uma nova entrada no histórico do navegador.