import 'package:crud_lista_compras/src/components/item_tile.dart';
import 'package:crud_lista_compras/src/provider/items_provider.dart';
import 'package:crud_lista_compras/src/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupermarketList extends StatelessWidget {
  const SupermarketList({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemsProvider users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de compras'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.userForm);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        // Quantidade de itens que temos para mostrar na lista, que irá carregar
        // apenas o itens que aparecem na tela.
        itemCount: users.count,
        // criar um componente
        itemBuilder: (_, index) => ItemTile(
          // Irá pegar elementos a partir dos indices do Map "users"
          users.byIndex(index),
        ),
      ),
    );
  }
}
