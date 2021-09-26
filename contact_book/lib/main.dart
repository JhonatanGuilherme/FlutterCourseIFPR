import 'package:flutter/material.dart';
import 'app/my_app.dart';

/*
  O desenvolvimento assíncrono em si é um recurso fundamental para
  que se possa buscar arquivos externos da aplicação ou acessar o
  banco de dados, por exemplo.
*/

/*
  Utilizando somente o Future, a função stringFromTheFuture será
  apresentada assim que a informação for acessada, mas o restante
  da função main irá ser executada normalmente enquanto, em paralelo,
  a função Future está em processo.
*/

/*
  Já o Async-Await, é um recurso para que se possa chamar uma
  função, nesse caso searchingInDataBase(), simulando uma pesquisa
  no Banco de Dados que é necessária para que o restante da
  aplicação funcione corretamente. Nesse caso, a função main espera
  o retorno da função para prosseguir com o restante das linhas.
*/

void main() async {
  runApp(const MyApp());
}

// void main() async {
//   await searchingInDataBase();
//   stringFromTheFuture();
//   print('Carregando demais componentes de uma aplicação.');
// }

// Future searchingInDataBase() {
//   return Future.delayed(const Duration(seconds: 2),
//       () => print('É necessário ser carregado primeiro.'));
// }

// Future stringFromTheFuture() {
//   return Future.delayed(
//       const Duration(seconds: 2), () => print('Pode ser carregado depois.'));
// }
