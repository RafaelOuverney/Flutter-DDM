import 'package:flutter/material.dart';

class WidgetEstado extends StatelessWidget {
  const WidgetEstado({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cadastro Estado'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome do Estado'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Sigla do Estado'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, '/estado');
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        )
      );
  }
}
