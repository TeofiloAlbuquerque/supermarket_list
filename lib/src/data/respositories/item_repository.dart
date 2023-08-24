import 'package:lista_compras/src/domain/models/item_model.dart';

class ItemRepository {
  static List<Item> listItens = [
    const Item(
      id: '01',
      name: 'Uva',
      quantity: 1,
      unit: 'kg',
      price: 6.80,
      category: 'Frutas',
     // imageUrl: 'imageUrl',
    ),
    const Item(
      id: '02',
      name: 'Manteiga',
      quantity: 1,
      unit: 'g',
      price: 24.80,
      category: 'Padaria',
     // imageUrl: 'imageUrl',
    ),
    const Item(
      id: '03',
      name: 'Detergente',
      quantity: 1,
      unit: 'ml',
      price: 4.80,
      category: 'Limpeza',
     // imageUrl: 'imageUrl',
    ),
    const Item(
      id: '04',
      name: 'Papel Higiênico',
      quantity: 1,
      unit: 'un',
      price: 5.85,
      category: 'Higiene',
     // imageUrl: 'imageUrl',
    ),
  ];
}
