import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/colors/colors_app.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:lista_compras/src/data/firebase/product_repository.dart';

class SupermarketListView extends StatefulWidget {
  const SupermarketListView({super.key});

  @override
  State<SupermarketListView> createState() => _SupermarketListViewState();
}

class _SupermarketListViewState extends State<SupermarketListView> {
  //final database = FirebaseDatabase.instance.ref('products');
  late FirebaseFirestore db;
  late AuthService auth;
  String _database = '';
  late final DatabaseReference _databaseRef; // onde será salvo
  // Irá receber os eventos do database, quando fizeremos update no database,
  // iremos receber tais mudanças no App tbm
  late StreamSubscription<DatabaseEvent> _databaseSubscription;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    // Inicializamos a Referencia
    _databaseRef = FirebaseDatabase.instance.ref('products');
    // Pegamos um valor que já esteja no banco de dados
    try {
      final dataSnapshot = await _databaseRef.get();
      _database = dataSnapshot.value as String;
    } catch (error) {
      debugPrint(error.toString());
    }
    // Para cada alteração que houver no Database serão passadas por do "event"
    _databaseSubscription = _databaseRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        // Se não houver valores, retorne "0", se retornar nulo
        _database = (event.snapshot.value ?? '0') as String;
      });
    });
  }

  database() async {
    // Ver como fica
    await _databaseRef.set(ServerValue());
  }

  @override
  void dispose() {
    _databaseSubscription.cancel();
    super.dispose();
  }

  // final productRespository = ProductRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Database example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FirebaseAnimatedList(
                query: database as Query,
                itemBuilder: (context, snapshot, animation, index) {
                  return Card(
                    color: AppColors.greyLight,
                    child: ListTile(
                      title: Text(
                        snapshot.child('name').value.toString(),
                      ),
                    ),
                  );
                },
              ),
              // child: ListView.builder(
              //   itemCount: productRespository.products().length,
              //   itemBuilder: (_, index) {
              //     final product = productRespository.products()[index];
              //     return ListTile(
              //       title: Text(product.name),
              //     );
              //   },
              // ),
            )
          ],
        ),
      ),
    );
  }
}
