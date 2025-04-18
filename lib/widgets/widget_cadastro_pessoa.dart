import 'package:flutter/material.dart';

class CadastroPessoa extends StatefulWidget {
  const CadastroPessoa({super.key});

  @override
  State<CadastroPessoa> createState() => _CadastroPessoaState();
}

class _CadastroPessoaState extends State<CadastroPessoa>{
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
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Idade'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Cidade'),
                keyboardType: TextInputType.emailAddress,
              ),
              DropdownButtonFormField(
                decoration: const InputDecoration(labelText: 'Estado'),
                  items: const [
                    DropdownMenuItem(value: "SC", child: Text('Santa Catarina')),
                    DropdownMenuItem(value: "RS", child: Text('Rio Grande do Sul')),
                    DropdownMenuItem(value: "PR", child: Text('Paraná')),
                  ],
                  onChanged: (e) {},
                ),

                SizedBox(height: 16,),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    
                  });

                  Navigator.pop(context, '/pessoa');
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