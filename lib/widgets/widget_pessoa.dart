import 'package:flutter/material.dart';
import 'package:widgets/config/rotas.dart';

class WidgetPessoa extends StatefulWidget {
  const WidgetPessoa({super.key});

  @override
  State<WidgetPessoa> createState() => _WidgetPessoaState();
}

class _WidgetPessoaState extends State<WidgetPessoa> {
  final _formKey = GlobalKey<FormState>();
  String _nome = '';
  String _telefone = '';
  String _url = '';

  var pessoas = [
    {
      'nome': 'João',
      'idade': 30,
      'telefone': '119995668',
      'cidade': 'São Paulo',
      'url':
          'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg',
    },
    {
      'nome': 'Maria',
      'idade': 25,
      'telefone': '12999999999',
      'cidade': 'Rio de Janeiro',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&s',
    },
    {
      'nome': 'Pedro',
      'idade': 35,
      'telefone': '12888888888',
      'cidade': 'Belo Horizonte',
      'url':
          'https://media.istockphoto.com/id/1682296067/photo/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=9zbG2-9fl741fbTWw5fNgcEEe4ll-JegrGlQQ6m54rg=',
    },
    {
      'nome': 'Ana',
      'idade': 28,
      'telefone': '127777777777',
      'cidade': 'Curitiba',
      'url':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvPjv1lHEIpzgDk_e3Sm-e4EVOzggYdb5aHA&s',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Pessoas')),
      body: Padding(
        padding: MediaQuery.of(context).size.width > 600
            ? const EdgeInsets.symmetric(horizontal: 16, vertical: 20)
            : const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: pessoas.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap:() => showDialog(context: context, builder: (BuildContext context)=> AlertDialog(
                title: Text('Dados da Pessoa'),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('nome:${pessoas[index]['nome']}'),
                    Text('Idade: ${pessoas[index]['idade']}'),
                    Text('Telefone: ${pessoas[index]['telefone']}'),
                    Text('Cidade: ${pessoas[index]['cidade']}'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Fechar'),
                  ),
                ],
              )),
              leading: GestureDetector(
                  onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      Image.network(
                        pessoas[index]['url'].toString(),
                        fit: BoxFit.cover,
                        width: 280,
                      ),
                      ],
                    ),
                    actions: [
                      TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Fechar'),
                      ),
                    ],
                    ),
                  );
                  },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(pessoas[index]['url'].toString()),
                  
                ),
              ),
              title: Text(pessoas[index]['nome'].toString()),
              subtitle: Text('Idade: ${pessoas[index]['idade']}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Scaffold(
                            appBar: AppBar(
                              title: const Text('Editar Pessoa'),
                            ),
                            body: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextFormField(
                                      initialValue: pessoas[index]['nome'].toString(),
                                      decoration: const InputDecoration(labelText: 'Nome'),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor, insira o nome';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _nome = value ?? '';
                                      },
                                    ),
                                    TextFormField(
                                      initialValue: pessoas[index]['url'].toString(),
                                      decoration: const InputDecoration(labelText: 'Image URL'),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor, insira a URL da imagem';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _url = value ?? '';
                                      },
                                    ),
                                    const SizedBox(height: 16),
                                    TextFormField(
                                      initialValue: pessoas[index]['telefone'].toString(),
                                      decoration: const InputDecoration(labelText: 'Telefone'),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor, insira o telefone';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _telefone = value ?? '';
                                      },
                                    ),
                                    const SizedBox(height: 32),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!.validate()) {
                                              _formKey.currentState!.save();
                                              setState(() {
                                                pessoas[index]['nome'] = _nome;
                                                pessoas[index]['telefone'] = _telefone;
                                                pessoas[index]['url'] = _url;
                                              });
                                              Navigator.of(context).pop();
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(content: Text('Dados salvos com sucesso!')),
                                              );
                                            }
                                          },
                                          child: const Text('Salvar'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                          ),
                                          child: const Text('Cancelar'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.edit, color: Colors.blue),
                  ),
                  IconButton(
                    onPressed:
                        () => showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            icon: Icon(Icons.warning, color: const Color.fromARGB(255, 179, 12, 0)),
                            title: const Text('Atenção!'),
                            content: const Text('A exclusão é irreversível! Deseja realmente excluir?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Implementar a lógica de exclusão aqui
                                  setState(() {
                                    pessoas.removeAt(index);
                                  });
                                  Navigator.of(context).pop();
                                  showDialog(context: context, builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Sucesso!'),
                                      content: const Text('Registro excluído com sucesso!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    );
                                  });
                                },
                                child: const Text('Excluir'),
                              ),
                            ],
                          ),
                        ),
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Rotas.cadastroPessoa);
        },
        tooltip: 'Adicionar Pessoa',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
