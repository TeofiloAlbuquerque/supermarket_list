import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/colors/colors_app.dart';
import 'package:lista_compras/src/design_system/widgets/custom_app_bar.dart';
import 'package:lista_compras/src/design_system/widgets/custom_elevated_button.dart';
import 'package:lista_compras/src/provider/text_field_provider.dart';
import 'package:lista_compras/src/routes/app_routes.dart';
import 'package:provider/provider.dart';

class NeedBuyView extends StatelessWidget {
  const NeedBuyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        background: AppColors.blue,
        titleProvider: Consumer<TextFieldProvider>(
          builder: (context, textFieldProvider, child) {
            return Text(textFieldProvider.textFieldValue);
          },
        ),
        titleColor: AppColors.white,
      ),
      body: Stack(
        children: <Widget>[
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'O que você precisa comprar?',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Toque no botão "Adicionar" para começar a incluir produtos',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            right: 5,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 45,
                right: 25,
              ),
              child: CustomElevatedButton(
                icon: const Icon(Icons.add),
                label: const Text('Adicionar'),
                backgroundColor: Colors.blue,
                iconColor: AppColors.white,
                textColor: AppColors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.supermarketList,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
