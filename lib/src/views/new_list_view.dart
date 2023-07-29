import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/components/custom_text_field.dart';
import '../design_system/colors/colors_app.dart';
import '../routes/app_routes.dart';

class NewListView extends StatelessWidget {
  const NewListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              text: 'Nova lista',
              colorBorder: ColorsApp.grey,
              colorLabel: ColorsApp.grey,
              colorFill: ColorsApp.greyLight,
              keyboardType: TextInputType.name,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 280,
                bottom: 10,
              ),
              child: Text('Sugestões'),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              text: 'Limite de gastos (Opcional)',
              colorBorder: ColorsApp.grey,
              colorLabel: ColorsApp.grey,
              colorFill: ColorsApp.greyLight,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.itemForm,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('CRIAR'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
