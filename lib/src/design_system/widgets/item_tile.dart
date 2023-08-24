import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/models/item_model.dart';
import '../../provider/items_provider.dart';
import '../../routes/app_routes.dart';

class ItemTile extends StatelessWidget {
  final Item item;
  // Porr ter apenas parametros finais, o construtor pode ser Const
  const ItemTile(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Se não for inserido uma imageUrl, irá colocar por padrão, um icone
    // personalizado
    // final avatar = item.imageUrl.isEmpty
    //     ? const CircleAvatar(
    //         child: Icon(Icons.person),
    //       )
    //     : CircleAvatar(
    //         backgroundImage: NetworkImage(item.imageUrl),
    //       );
    return ListTile(
      //leading: avatar,
      title: Text(item.name),
      subtitle: Text('${item.quantity} ${item.unit} = ${item.price}'),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.amber,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.itemForm,
                // Irá passar o "user" como parametro na navegação
                arguments: item,
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.red,
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text('Excluir Item'),
                  content: const Text('Tem certeza?'),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    TextButton(
                      child: const Text('Sim'),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
                // Como o "ShowDialog" espera um Future, podemos usar o metodo
                // "then" e definir uma condição, de que o provider só irá
                // remover se a condição for realizada
              ).then((confirmed) {
                Provider.of<ItemsProvider>(
                  context,
                  listen: false,
                ).remove(item);
              });
            },
          )
        ]),
      ),
    );
  }
}
