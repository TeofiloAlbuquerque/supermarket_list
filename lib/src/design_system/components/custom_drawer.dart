import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/colors/colors_app.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.greyLight,
            ),
            child: const Text('Entrar'),
          ),
          ListTile(
            title: const Text('Produtos'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Unidades de medida'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Aparência'),
            onTap: () {},
          ),
          ListTile(
            title: const Text(
                'Curtiu o aplicativo? Avalie-nos com 5 estrelas no Google Play'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Remover propagandas'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Ajuda e feedback'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Sobre'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
