import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/src/domain/models/product_model.dart';
import '../data/respositories/product_respository.dart';

class SupermarketListView extends StatelessWidget {
  SupermarketListView({super.key});
  final ProductRepository _repository = ProductRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Lista de produtos'),
      ),
      body: Center(
        child: SizedBox(
          child: StreamBuilder<List<Product>>(
            stream: _repository.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final products = snapshot.data!;
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(products[index].name),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Text('Algo deu errado!');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}


