import 'package:flutter/material.dart';
import 'package:widgets/widgets/widget_pessoa.dart';

class CadastroPessoa extends StatefulWidget {
  const CadastroPessoa({super.key});

  @override
  State<CadastroPessoa> createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa>{
  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final cidadeController = TextEditingController();
  final telefoneController = TextEditingController();
  final estadoController = TextEditingController();
  final profileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Pessoa'),
      ),
      body: Padding(padding: const EdgeInsets.all(25.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) => value == null || value.isEmpty ? 'Nome é obrigatório' : null,
                controller: nomeController,
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                validator: (value) => value == null || value.isEmpty ? 'Idade é obrigatório' : null,
                controller: idadeController,
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                validator: (value) => value == null || value.isEmpty ? 'Cidade é obrigatório' : null,
                controller: cidadeController,
                decoration: const InputDecoration(labelText: 'Cidade'),
              ),
              DropdownButtonFormField(
                
                decoration: const InputDecoration(labelText: 'Estado'),
                  items: const [
                    DropdownMenuItem(value: "SC", child: Text('Santa Catarina')),
                    DropdownMenuItem(value: "RS", child: Text('Rio Grande do Sul')),
                    DropdownMenuItem(value: "PR", child: Text('Paraná')),
                  ],
                  onChanged: (value) => setState(() {
                    estadoController.text = value.toString();

                  }),
                  value: estadoController.text.isEmpty ? null : estadoController.text,
                  validator: (value) => value == null || value.isEmpty ? 'Estado é obrigatório' : null,
                ),
              TextFormField(
                controller: telefoneController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                keyboardType: TextInputType.phone,
              ),
              TextFormField(
                controller: profileController,
                decoration: const InputDecoration(labelText: 'URL foto do perfil'),
              ),
              const SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () {
                  FormFieldValidator<String> validator = (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  };
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                  setState(() {
                    pessoas.add({
                      'nome': nomeController.text,
                      'telefone': telefoneController.text,
                      'idade': idadeController.text,
                      'cidade': cidadeController.text,
                      'url': profileController.text.isEmpty ? 'https://th.bing.com/th/id/OIP.qOSjSxoUNci9aPL9spX_eQHaHa?rs=1&pid=ImgDetMain' : profileController.text,
                      'estado': estadoController.text,
                    });
                  Navigator.pop(context, '/pessoa');
                  });

                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}