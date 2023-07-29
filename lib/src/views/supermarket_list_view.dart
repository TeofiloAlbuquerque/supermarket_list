import 'package:crud_lista_compras/src/design_system/components/item_tile.dart';
import 'package:crud_lista_compras/src/provider/items_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupermarketListView extends StatelessWidget {
  const SupermarketListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemsProvider items = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas listas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              // Quantidade de itens que temos para mostrar na lista, que irá carregar
              // apenas o itens que aparecem na tela.
              itemCount: items.count,
              // criar um componente
              itemBuilder: (_, index) => ItemTile(
                // Irá pegar elementos a partir dos indices do Map "users"
                items.byIndex(index),
              ),
            ),
          ),
          // Container(
          //   color: Colors.blue,
          //   padding: const EdgeInsets.symmetric(
          //     horizontal: 16,
          //     vertical: 26,
          //   ),
          //   child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text('Total (1) R\$ 6,80'),
          //       Text('Carrinho (0) R\$ 0,00'),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
