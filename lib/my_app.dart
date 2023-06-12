import 'package:crud_lista_compras/src/provider/items_provider.dart';
import 'package:crud_lista_compras/src/routes/app_routes.dart';
import 'package:crud_lista_compras/src/views/supermarket_list.dart';
import 'package:crud_lista_compras/src/views/list_form.dart';
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
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightBlue,
          ),
        ),
        routes: {
          AppRoutes.home: (_) => const SupermarketList(),
          AppRoutes.userForm: (_) => const ItemForm(),
        },
      ),
    );
  }
}
