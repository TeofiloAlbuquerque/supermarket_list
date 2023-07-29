import 'package:crud_lista_compras/src/design_system/colors/colors_app.dart';
import 'package:crud_lista_compras/src/design_system/components/custom_card.dart';
import 'package:crud_lista_compras/src/models/card_model.dart';
import 'package:crud_lista_compras/src/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CardModel> cardList = [
    CardModel(titleCard: 'Julho', quantityProducts: 6, priceProductList: 95.55),
    CardModel(
        titleCard: 'Agosto', quantityProducts: 10, priceProductList: 126.83),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Setembro', quantityProducts: 3, priceProductList: 85.10),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.greyLight,
      appBar: AppBar(
        title: const Text('Minhas listas'),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorsApp.orange,
              ),
              child: const Text('Drawer Header'),
            ),
            ListTile(
              title: Text(
                'Item 2',
                style: TextStyle(
                  color: ColorsApp.white,
                ),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      // NavigationDrawer(
      //   children: [],
      // ),
      body: Stack(
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
              child: SizedBox(
                height: 40,
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
            ),
          )
        ],
      ),
    );
  }
}
