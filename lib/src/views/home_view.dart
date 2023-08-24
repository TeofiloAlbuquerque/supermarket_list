import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/widgets/custom_app_bar.dart';
import 'package:lista_compras/src/design_system/widgets/custom_drawer.dart';
import 'package:lista_compras/src/design_system/widgets/custom_elevated_button.dart';
import '../design_system/colors/colors_app.dart';
import '../design_system/widgets/custom_card.dart';
import '../domain/models/card_model.dart';
import '../routes/app_routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CardModel> cardList = [
    CardModel(
        titleCard: 'Evento GDG',
        quantityProducts: 26,
        priceProductList: 1465.10),
    CardModel(
        titleCard: 'Agosto', quantityProducts: 32, priceProductList: 495.55),
    CardModel(
        titleCard: 'Julho', quantityProducts: 28, priceProductList: 426.83),
    CardModel(
        titleCard: 'Viagem Viçosa',
        quantityProducts: 16,
        priceProductList: 285.10),
    CardModel(
        titleCard: 'Junho', quantityProducts: 29, priceProductList: 436.65),
    CardModel(
        titleCard: 'Maio', quantityProducts: 30, priceProductList: 456.83),
    CardModel(
        titleCard: 'Abril', quantityProducts: 33, priceProductList: 476.83),
    CardModel(
        titleCard: 'Aniversario da Bia',
        quantityProducts: 17,
        priceProductList: 582.10),
    CardModel(titleCard: 'Março', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Material Escolar',
        quantityProducts: 3,
        priceProductList: 85.10),
    CardModel(
        titleCard: 'Viagem Salvador',
        quantityProducts: 3,
        priceProductList: 85.10),
    CardModel(
        titleCard: 'Fevereiro', quantityProducts: 3, priceProductList: 85.10),
    CardModel(
        titleCard: 'Janeiro', quantityProducts: 3, priceProductList: 85.10),
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
      backgroundColor: AppColors.greyLight,
      appBar: CustomAppBar(
        titleCallback: () => 'Minhas listas',
        background: AppColors.blue,
      ),
      drawer: const CustomDrawer(),
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
          Positioned(
            bottom: 0,
            right: 12,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
                right: 25,
              ),
              child: CustomElevatedButton(
                icon: const Icon(Icons.add),
                label: const Text('Nova lista'),
                backgroundColor: AppColors.blue,
                iconColor: AppColors.white,
                textColor: AppColors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.newList,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
