import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../design_system/widgets/item_tile.dart';
import '../provider/items_provider.dart';

class FeedbackProductsView extends StatelessWidget {
  const FeedbackProductsView({super.key});

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
        ],
      ),
    );
  }
}
