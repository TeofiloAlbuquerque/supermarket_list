import 'package:crud_lista_compras/src/models/user.dart';
import 'package:crud_lista_compras/src/provider/items_provider.dart';
import 'package:crud_lista_compras/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  final User user;
  // Porr ter apenas parametros finais, o construtor pode ser Const
  const ItemTile(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Se não for inserido uma imageUrl, irá colocar por padrão, um icone personalizado
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(children: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.amber,
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.userForm,
                // Irá passar o "user" como parametro na navegação
                arguments: user,
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
                  title: const Text('Excluir Usuário'),
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
                Provider.of<ItemsProvider>(context, listen: false).remove(user);
              });
            },
          )
        ]),
      ),
    );
  }
}
