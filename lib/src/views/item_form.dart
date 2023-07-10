import 'package:crud_lista_compras/src/models/item.dart';
import 'package:crud_lista_compras/src/provider/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  // Metodo para preencher os dados por meio do botão de ALTERAR
  void _loadFormData(Item item) {
    _formData['id'] = item.id;
    _formData['name'] = item.name;
    _formData['amout'] = item.amout.toString();
    _formData['unit'] = item.unit.toString();
    _formData['price'] = item.price.toString();
    _formData['category'] = item.category;
    _formData['observation'] = item.observation ?? '';
    _formData['imageUrl'] = item.imageUrl;
  }

  // persistencia de dados
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Item? item = ModalRoute.of(context)!.settings.arguments as Item?;
    if (item != null) {
      _loadFormData(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Metodo para ADICIONAR
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState!.save();
                // "listen: false", fará com que o provider não seja notificado
                Provider.of<ItemsProvider>(context, listen: false).put(
                  Item(
                    id: _formData['id'] ?? '',
                    name: _formData['name'] ?? '',
                    amout: int.parse(_formData['amout'] ?? '0'),
                    unit: Units.values.firstWhere(
                      (unit) =>
                          unit.toString() ==
                          (_formData['unit'] ?? Units.un.toString()),
                      // orElse: () => Units.un),
                    ),
                    price: double.parse(_formData['price'] ?? '0.0'),
                    category: _formData['category'] ?? '',
                    observation: _formData['observation'],
                    imageUrl: _formData['imageUrl'] ?? '',
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
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
            ],
          ),
        ),
      ),
    );
  }
}
