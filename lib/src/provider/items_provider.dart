import 'package:flutter/material.dart';
import '../data/dummy_items.dart';
import '../models/item_model.dart';

// Pesquisar sobre o padrão OBSERVER (Importante)
// Iremos utilizar o Provider para controlar o map de Itens
// "with", Mixin
class ItemsProvider extends ChangeNotifier {
  final Map<String, Item> _items = {...dummyItems};
  // get para retornar todos os Usuarios da lista
  List<Item> get all {
    // Sempre retornarmos um clone da lista para evitarmos retornar uma
    // referencia para o map, pois assim qualquer parte da aplicação poderia
    // alterar o map sem que a classe seja notificada.
    return [..._items.values];
  }

  // Get para retornar o tamanho da lista
  int get count {
    return _items.length;
  }

  // Ter acesso a um indice na lista sem precisar acessar ao get "all" e ter que
  // toda vez clonar a lista.
  Item byIndex(int index) {
    return _items.values.elementAt(index);
  }

  void put(Item item) {
    // Teste para saber se vamos Adicionar ou Alterar
    // Se conter o "item.id" irá fazer uma Alteração
    // metodo "trim()" remover os espaços em branco
    if (item.id.trim().isNotEmpty == true && _items.containsKey(item.id)) {
      // Alterar
      _items.update(
        item.id,
        (existingitem) => Item(
          id: existingitem.id,
          name: item.name,
          quantity: item.quantity,
          unit: item.unit,
          price: item.price,
          category: item.category,
          // observation: item.observation,
          imageUrl: item.imageUrl,
        ),
      );
    } else {
      // Adicionar
      // Quando o usuario não tiver uma ID, significa que ele é um novo elemento
      int timestamp = DateTime.now().millisecondsSinceEpoch;
      final id = timestamp.toString();
      // "putIfAbsent" é um metodo da clase Map que permite adicionar um par de
      // chave/valor a um mapa somente se a chave especificada ainda não estiver
      // no mapa. Recebe 2 parametros, a chave que se deseja adicionar no mapa e
      // ifAbsent, uma função sem parametros que é chamada para fornecer o valor
      // a se associado a chave
      // Inserir de forma fixa um item
      _items.putIfAbsent(
        id,
        () => Item(
          id: id,
          name: item.name,
          quantity: item.quantity,
          unit: item.unit,
          price: item.price,
          category: item.category,
          //  observation: item.observation,
          imageUrl: item.imageUrl,
        ),
      );
    }

    // ou alterar
    // Irá notificar o Provider para mudanças
    notifyListeners();
  }

  void remove(Item item) {
    _items.remove(item.id);
    notifyListeners();
  }
}
