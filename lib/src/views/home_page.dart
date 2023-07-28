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
    CardModel(titleCard: 'Julho', quantityProducts: 6, priceProductList: 95.55),
    CardModel(
        titleCard: 'Agosto', quantityProducts: 10, priceProductList: 126.83),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
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
      drawer: const Drawer(),
      // NavigationDrawer(
      //   children: [],
      // ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: cardList.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 3,
                  ),
                  child: CustomCard(
                    cardData: cardList[index],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.newList,
                  );
                },
                icon: const Icon(Icons.add),
                label: const Text('Nova lista'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
