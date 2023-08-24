import 'package:flutter/material.dart';
import '../../domain/models/card_model.dart';
import '../../routes/app_routes.dart';
import '../colors/colors_app.dart';

class CustomCard extends StatelessWidget {
  final CardModel cardData;
  const CustomCard({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.supermarketList,
        );
      },
      child: Card(
        elevation: 4.0,
        color: AppColors.white,
        child: ListTile(
          title: Text(cardData.titleCard),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Total: R\$ ${cardData.priceProductList}'),
              Text('${cardData.quantityProducts}/${cardData.quantityProducts}'),
              // LinearProgressIndicator(
              //   value: cardData.progressPercentage,
              // )
            ],
          ),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
