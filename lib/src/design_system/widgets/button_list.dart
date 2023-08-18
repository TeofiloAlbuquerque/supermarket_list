import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/colors/colors_app.dart';
import 'package:lista_compras/src/design_system/widgets/custom_elevated_button.dart';

class ButtonList extends StatelessWidget {
  final List<String> buttonTexts = [
    'Compras',
    'Mantimentos',
    '04/08/2023',
    'Fim de semana',
    'Sexta-feira',
    'Viagem',
    'Supermercado',
    'Casa',
    'Farmacia',
    'Alimentos',
  ];
  ButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: buttonTexts.length,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: CustomElevatedButton(
            backgroundColor: AppColors.beige,
            label: Text(buttonTexts[index]),
            onPressed: () {},
            textColor: AppColors.black,
          ),
        );
      },
    );
  }
}
