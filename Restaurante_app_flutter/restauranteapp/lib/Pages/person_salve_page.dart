import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPersonPage extends StatefulWidget {
  const MyPersonPage({super.key});

  @override
  _MyPersonPageState createState() => _MyPersonPageState();
}

class _MyPersonPageState extends State<MyPersonPage> {
  // Controladores para os campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Chave para o formulário (usada para validação)
  final _formKey = GlobalKey<FormState>();

  // Método para salvar o perfil no Firestore
  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        final firestore = FirebaseFirestore.instance;
        await firestore.collection('users').add({
          'name': _nameController.text,
          'age': int.parse(_ageController.text),
          'email': _emailController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });
        await firestore.collection('orders').add({
          'name': _nameController.text,
          'age': int.parse(_ageController.text),
          'email': _emailController.text,
          'timestamp': FieldValue.serverTimestamp(),
        });

        // Limpa os campos após salvar
        _nameController.clear();
        _ageController.clear();
        _emailController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Perfil salvo com sucesso!')),
        );
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar perfil: $error')),
        );
      }
    }
  }

  @override
  void dispose() {
    // Limpa os controladores quando o widget for descartado
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Perfil'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personalize seu Cadastro de Usuário',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Campo para o nome
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Campo para a idade
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Idade',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua idade';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Idade deve ser um número';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // Campo para o e-mail
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  if (!value.contains('@')) {
                    return 'E-mail inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              // Botão para salvar
              Center(
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 0, 0),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  ),
                  child: const Text(
                    'Salvar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}