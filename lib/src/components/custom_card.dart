import 'package:crud_lista_compras/src/models/card_model.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final CardModel cardData;
  const CustomCard({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        title: Text(cardData.titleCard),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${cardData.amount}'),
            LinearProgressIndicator(
              value: cardData.progressPercentage,
            )
          ],
        ),
      ),
    );
  }
}
