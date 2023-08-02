import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/colors/colors_app.dart';
import 'package:lista_compras/src/design_system/widgets/custom_app_bar.dart';
import 'package:lista_compras/src/provider/text_field_provider.dart';
import 'package:provider/provider.dart';

class NeedBuyView extends StatelessWidget {
  const NeedBuyView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final String textFieldValue =
        Provider.of<TextFieldProvider>(context).textFieldValue;
    return Scaffold(
      appBar: CustomAppBar(
        background: AppColors.blue,
        title: textFieldValue,
        titleColor: AppColors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('data'),
            Text('Data 2'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text('Adicionar'),
      ),
    );
  }
}
