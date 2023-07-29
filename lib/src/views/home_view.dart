import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/components/custom_app_bar.dart';
import '../design_system/colors/colors_app.dart';
import '../design_system/components/custom_card.dart';
import '../models/card_model.dart';
import '../routes/app_routes.dart';

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
      appBar: CustomAppBar(
        title: 'Minhas listas',
        background: ColorsApp.blue,
      ),
      // appBar: AppBar(
      //   title: const Text('Minhas listas'),
      // ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: ColorsApp.blue,
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
              padding: const EdgeInsets.only(
                bottom: 40,
                right: 25,
              ),
              child: SizedBox(
                height: 45,
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
