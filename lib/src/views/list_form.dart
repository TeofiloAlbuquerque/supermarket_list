import 'package:crud_lista_compras/src/models/user.dart';
import 'package:crud_lista_compras/src/provider/items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemForm extends StatefulWidget {
  const ItemForm({super.key});

  @override
  State<ItemForm> createState() => _UserFormState();
}

class _UserFormState extends State<ItemForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  // Metodo para preencher os dados por meio do botão de ALTERAR
  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
  }

  // persistencia de dados
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User? user = ModalRoute.of(context)!.settings.arguments as User?;
    if (user != null) {
      _loadFormData(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de Usuario'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Metodo para ADICIONAR
              final isValid = _form.currentState!.validate();
              if (isValid) {
                _form.currentState!.save();
                // "listen: false", fará com que o provider não seja notificado
                Provider.of<ItemsProvider>(context, listen: false).put(
                  User(
                    id: _formData['id'] ?? '',
                    name: _formData['name'] ?? '',
                    email: _formData['email'] ?? '',
                    avatarUrl: _formData['avatarUrl'] ?? '',
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
                  }
                  if (value.trim().length < 3) {
                    return 'Nome muito pequeno. No minimo de 3 letras';
                  }
                  return null;
                },

                onSaved: (value) {
                  if (value != null) {
                    _formData['name'] = value;
                  }
                },
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'E-mail: '),
                onSaved: (value) {
                  if (value != null) {
                    _formData['email'] = value;
                  }
                },
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: const InputDecoration(labelText: 'URL do Avatar: '),
                onSaved: (value) {
                  if (value != null) {
                    _formData['avatarUrl'] = value;
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
