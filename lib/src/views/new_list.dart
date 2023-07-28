import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class NewList extends StatelessWidget {
  const NewList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                labelText: 'Nova lista',
                labelStyle: TextStyle(
                  color: Colors.blueGrey,
                ),
                fillColor: Colors.grey,
                filled: true,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.itemForm,
                );
              },
              child: const Text('CRIAR'),
            ),
          ],
        ),
      ),
    );
  }
}
