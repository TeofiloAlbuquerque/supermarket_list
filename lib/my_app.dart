import 'package:crud_lista_compras/src/provider/items_provider.dart';
import 'package:crud_lista_compras/src/routes/app_routes.dart';
import 'package:crud_lista_compras/src/views/home_page.dart';
import 'package:crud_lista_compras/src/views/item_form.dart';
import 'package:crud_lista_compras/src/views/new_list.dart';
import 'package:crud_lista_compras/src/views/supermarket_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Emvolvemos o MaterialApp com o ChangeNotifierProvider para "ouvir" toda
    // a aplicação.
    // Podemos ter uma lista de Providers, utilizando o "MultiProvider()"
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          // A classe "ItemsProvider" é o "ChangeNotifier" da nossa aplicação, e que
          // implementa o padrão Observer, no qual o Provider vai se basear para
          // notificar os items quando houver alguma mudança.
          create: (ctx) => ItemsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de compras',
        theme: ThemeData(
          //useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlue,
          ),
        ),
        routes: {
          AppRoutes.home: (_) => const HomePage(),
          AppRoutes.newList: (_) => const NewList(),
          AppRoutes.itemForm: (_) => const ItemForm(),
          AppRoutes.supermarketList: (_) => const SupermarketList(),
        },
      ),
    );
  }
}
