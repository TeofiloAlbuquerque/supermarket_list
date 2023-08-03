import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/widgets/custom_text_field.dart';
import 'package:lista_compras/src/provider/text_field_provider.dart';
import 'package:provider/provider.dart';
import '../design_system/colors/colors_app.dart';
import '../design_system/widgets/custom_app_bar.dart';
import '../routes/app_routes.dart';

class NewListView extends StatefulWidget {
  const NewListView({super.key});

  @override
  State<NewListView> createState() => _NewListViewState();
}

class _NewListViewState extends State<NewListView> {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        background: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.blue,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomTextField(
              text: 'Nova lista',
              colorBorder: AppColors.grey,
              colorLabel: AppColors.grey,
              colorFill: AppColors.greyLight,
              keyboardType: TextInputType.name,
              controller: _textFieldController,
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
              colorBorder: AppColors.grey,
              colorLabel: AppColors.grey,
              colorFill: AppColors.greyLight,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            //const Spacer(),
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {
                  String textFieldValue = _textFieldController.text;
                  Provider.of<TextFieldProvider>(context, listen: false)
                      .setTextFieldValue(textFieldValue);
                  Navigator.of(context).pushNamed(
                    AppRoutes.needBuy,
                    arguments: textFieldValue,
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
