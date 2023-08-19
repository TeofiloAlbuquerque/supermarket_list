import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../design_system/colors/colors_app.dart';
import '../design_system/widgets/custom_dropdownbutton.dart';
import '../models/item_model.dart';
import '../provider/items_provider.dart';
import '../routes/app_routes.dart';

class ItemFormView extends StatefulWidget {
  const ItemFormView({super.key});

  @override
  State<ItemFormView> createState() => _ItemFormViewState();
}

class _ItemFormViewState extends State<ItemFormView> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};
  final List<String> units = [
    'un',
    'dz',
    'ml',
    'L',
    'kg',
    'g',
    'caixa',
    'embalagem',
    'galao',
    'garrafa',
    'lata',
    'pacote',
  ];

  final List<String> categories = [
    'Bazar e Limpeza',
    'Bebidas',
    'Carnes',
    'Comidas Prontas e Congelados',
    'Frios, Leites e Derivados',
    'Frutas, ovos e verduras',
    'Higiene Pessoal',
    'Importados',
    'Mercearia',
    'Padaria e Sobremesas',
    'Saúde e Beleza',
    'Sem categoria',
  ];

  String selectItem = 'un';

  // Metodo para preencher os dados por meio do botão de ALTERAR
  void _loadFormData(Item item) {
    _formData['id'] = item.id;
    _formData['name'] = item.name;
    _formData['amout'] = item.quantity.toString();
    _formData['unit'] = item.unit.toString();
    _formData['price'] = item.price.toString();
    _formData['category'] = item.category;
    _formData['observation'] = item.observation ?? '';
  //  _formData['imageUrl'] = item.imageUrl ?? '';
  }

  // persistencia de dados
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Item? item = ModalRoute.of(context)!.settings.arguments as Item?;
    if (item != null) {
      _loadFormData(item);
    }
    _loadSelectedItem();
  }

  void _saveSelectedItem() async {
    SharedPreferences unitPref = await SharedPreferences.getInstance();
    await unitPref.setString('selectedItem', selectItem);
  }

  void _loadSelectedItem() async {
    SharedPreferences unitPref = await SharedPreferences.getInstance();
    String? selectedItem = unitPref.getString('selectedItem');
    if (selectedItem != null) {
      setState(
        () {
          selectItem = selectedItem;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleColor: AppColors.white,
        background: AppColors.blue,
        trailing: IconButton(
          onPressed: () {
            // Metodo para SALVAR/ADICIONAR
            final isValid = _form.currentState!.validate();
            if (isValid) {
              _form.currentState!.save();
              Provider.of<ItemsProvider>(context, listen: false).put(
                Item(
                  id: _formData['id'] ?? '',
                  name: _formData['name'] ?? '',
                  quantity: int.parse(_formData['amout'] ?? '0'),
                  unit: _formData['unit'] ?? 'un',
                  price: double.parse(_formData['price'] ?? '0.0'),
                  category: _formData['category'] ?? '',
                  observation: _formData['observation'],
 //                 imageUrl: _formData['imageUrl'] ?? '',
                ),
              );
              Navigator.of(context).pushNamed(
                AppRoutes.supermarketList,
              );
            }
          },
          icon: const Icon(Icons.save),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            // Associamos a GlobalKey com o formulario para  validarmos
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  // Precisamos associar um valor inicial ao TextFormField,
                  // dessa forma, os dados já virão preenchidos
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(labelText: 'Nome: '),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Nome inválido';
                    } else if (value.trim().length < 3) {
                      return 'Nome muito pequeno. No minimo de 3 letras';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    if (value != null) {
                      _formData['name'] = value;
                    }
                  },
                ),
                TextFormField(
                  initialValue: _formData['amout'],
                  decoration: const InputDecoration(labelText: 'Quantidade: '),
                  onSaved: (value) {
                    if (value != null) {
                      _formData['amout'] = value;
                    }
                  },
                ),
                TextFormField(
                  initialValue: _formData['unit'],
                  decoration: const InputDecoration(labelText: 'Unidade: '),
                  onSaved: (value) {
                    if (value != null) {
                      _formData['unit'] = value;
                    }
                  },
                ),
                TextFormField(
                  initialValue: _formData['price'],
                  decoration: const InputDecoration(labelText: 'Preço: '),
                  onSaved: (value) {
                    if (value != null) {
                      _formData['price'] = value;
                    }
                  },
                ),
                TextFormField(
                  initialValue: _formData['category'],
                  decoration: const InputDecoration(labelText: 'Categoria: '),
                  onSaved: (value) {
                    if (value != null) {
                      _formData['category'] = value;
                    }
                  },
                ),
                TextFormField(
                  initialValue: _formData['observation'],
                  decoration: const InputDecoration(labelText: 'Observação: '),
                  onSaved: (value) {
                    if (value != null) {
                      _formData['observation'] = value;
                    }
                  },
                ),
                TextFormField(
                  initialValue: _formData['imageUrl'],
                  decoration: const InputDecoration(labelText: 'Imagem: '),
                  onSaved: (value) {
                    if (value != null) {
                      _formData['imageUrl'] = value;
                    }
                  },
                ),
                CustomDropdownButton(
                  onChanged: (String newValue) async {
                    setState(() {
                      selectItem = newValue;
                    });
                    // Salvando o valor selecionado
                    _saveSelectedItem();
                  },
                  selectItem: selectItem,
                  items: units,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
