import 'package:flutter/material.dart';

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
            SizedBox(
              width: 360,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    borderSide: BorderSide(
                      color: ColorsApp.grey,
                    ),
                  ),
                  labelText: 'Nova lista',
                  labelStyle: TextStyle(
                    color: ColorsApp.grey,
                  ),
                  fillColor: ColorsApp.greyLight,
                  filled: true,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 20,
                right: 280,
                bottom: 10,
              ),
              child: Text('Sugestões'),
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
