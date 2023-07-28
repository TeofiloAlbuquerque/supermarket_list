import 'package:crud_lista_compras/src/components/custom_card.dart';
import 'package:crud_lista_compras/src/models/card_model.dart';
import 'package:crud_lista_compras/src/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CardModel> cardList = [
    CardModel(titleCard: 'Julho', amount: 6, progressPercentage: 1),
    CardModel(titleCard: 'Agosto', amount: 10, progressPercentage: 5),
    CardModel(titleCard: 'Setembro', amount: 3, progressPercentage: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas listas'),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.of(context).pushNamed(
        //         AppRoutes.itemForm,
        //       );
        //     },
        //     icon: const Icon(Icons.add),
        //   ),
        // ],
      ),
      body: ListView.builder(
        itemCount: cardList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: CustomCard(
              cardData: cardList[index],
            ),
          );
        },
      ),
    );
  }
}
