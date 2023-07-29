import 'package:crud_lista_compras/src/design_system/colors/colors_app.dart';
import 'package:crud_lista_compras/src/provider/items_provider.dart';
import 'package:crud_lista_compras/src/routes/app_routes.dart';
import 'package:crud_lista_compras/src/views/home_view.dart';
import 'package:crud_lista_compras/src/views/item_form_view.dart';
import 'package:crud_lista_compras/src/views/new_list_view.dart';
import 'package:crud_lista_compras/src/views/supermarket_list_view.dart';
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
            seedColor: ColorsApp.orange,
          ),
        ),
        routes: {
          AppRoutes.home: (_) => const HomeView(),
          AppRoutes.newList: (_) => const NewListView(),
          AppRoutes.itemForm: (_) => const ItemFormView(),
          AppRoutes.supermarketList: (_) => const SupermarketListView(),
        },
      ),
    );
  }
}
