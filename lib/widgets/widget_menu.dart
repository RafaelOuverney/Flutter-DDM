import 'package:flutter/material.dart';
import 'package:widgets/config/rotas.dart';

class WidgetMenu extends StatelessWidget{
  const WidgetMenu({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 1, 49, 73),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(flex: 15),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, Rotas.home);
                          },
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    const Text('Menu', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.map),
                title: const Text('Cadastro Estado'),
                onTap: () {
                  Navigator.pushNamed(context, Rotas.estado);
                },
              ),
              ListTile(
                leading: Icon(Icons.location_city),
                title: const Text('Cadastro Cidade'),
                onTap: () {
                  Navigator.pushNamed(context, Rotas.cidade);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Cadastro Pessoa'),
                onTap: () {
                  Navigator.pushNamed(context, Rotas.pessoa);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Aplicativo'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('Bem vindo'),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Rotas.estado);
                },
                child: const Text('Ir para cadastro de estado'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Rotas.cidade);
                },
                child: const Text('Ir para cadastro de cidade'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Rotas.pessoa);
                },
                child: const Text('Ir para cadastro de pessoa'),
              ),
               TextFormField(
                cursorWidth: 5,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}