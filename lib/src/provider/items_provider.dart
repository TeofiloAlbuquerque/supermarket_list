import 'dart:math';
import 'package:crud_lista_compras/src/data/dummy_users.dart';
import 'package:crud_lista_compras/src/models/user.dart';
import 'package:flutter/material.dart';

// Pesquisar sobre o padrão OBSERVER (Importante)
// Iremos utilizar o Provider para controlar o map de Itens
// "with", Mixin
class ItemsProvider with ChangeNotifier {
  final Map<String, User> _items = {...dummyUsers};
  // get para retornar todos os Usuarios da lista
  List<User> get all {
    // Sempre retornarmos um clone da lista para evitarmos retornar uma referencia
    // para o map, pois assim qualquer parte da aplicação poderia alterar o map
    // sem que a classe seja notificada.
    return [..._items.values];
  }

  // Get para retornar o tamanho da lista
  int get count {
    return _items.length;
  }

  // Ter acesso a um indice na lista sem precisar acessar ao get "all" e ter que
  // toda vez clonar a lista.
  User byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(User user) {
    // if (user == null) {
    //   return;
    // }
    // Teste para saber se vamos Adicionar ou Alterar
    // Se conter o "user.id" irá fazer uma Alteração
    // metodo "trim()" remover os espaços em branco
    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      // Alterar
      _items.update(
        user.id,
        (existingUser) => User(
          id: existingUser.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    } else {
      // Adicionar
      // Quando o usuario não tiver uma ID, significa que ele é um novo elemento
      final id = Random().nextDouble().toString();
      // "putIfAbsent" é um metodo da clase Map que permite adicionar um par de
      // chave/valor a um mapa somente se a chave especificada ainda não estiver
      // no mapa. Recebe 2 parametros, a chave que se deseja adicionar no mapa e
      // ifAbsent, uma função sem parametros que é chamada para fornecer o valor
      // a se associado a chave
      // Inserir de forma fixa um User
      _items.putIfAbsent(
        id,
        () => User(
          id: user.id,
          name: user.name,
          email: user.email,
          avatarUrl: user.avatarUrl,
        ),
      );
    }

    // ou alterar
    // Irá notificar o Provider para mudanças
    notifyListeners();
  }

  void remove(User user) {
    _items.remove(user.id);
    notifyListeners();
  }
}
