// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/colors/colors_app.dart';
import 'package:lista_compras/src/design_system/components/custom_app_bar.dart';

class NeedBuyView extends StatelessWidget {


  final String? newListTitle;
  final String? appBarTitle;

  const NeedBuyView({
    super.key,
    this.newListTitle,
    this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        background: AppColors.blue,
        title: newListTitle,
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
