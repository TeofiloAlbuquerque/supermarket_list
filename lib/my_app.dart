import 'package:flutter/material.dart';
import 'package:lista_compras/src/provider/text_field_provider.dart';
import 'package:lista_compras/src/views/need_buy_view.dart';
import 'package:provider/provider.dart';

import 'src/design_system/colors/colors_app.dart';
import 'src/provider/items_provider.dart';
import 'src/routes/app_routes.dart';
import 'src/views/home_view.dart';
import 'src/views/item_form_view.dart';
import 'src/views/new_list_view.dart';
import 'src/views/supermarket_list_view.dart';

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
        ChangeNotifierProvider(
          create: (ctx) => TextFieldProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lista de compras',
        theme: ThemeData(
          //useMaterial3: true,
          primaryColor: AppColors.blue,
        ),
        routes: {
          AppRoutes.home: (_) => const HomeView(),
          AppRoutes.newList: (_) => const NewListView(),
          AppRoutes.needBuy: (_) => const NeedBuyView(),
          AppRoutes.itemForm: (_) => const ItemFormView(),
          AppRoutes.supermarketList: (_) => const SupermarketListView(),
        },
      ),
    );
  }
}
