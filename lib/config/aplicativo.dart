import 'package:flutter/material.dart';
import 'package:widgets/config/rotas.dart';
import 'package:widgets/widgets/widget_cadastro_pessoa.dart';
import 'package:widgets/widgets/widget_estado.dart';
import 'package:widgets/widgets/widget_menu.dart';
import 'package:widgets/widgets/widget_pessoa.dart';

class Aplicativo extends StatelessWidget {
  const Aplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplicativo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: Rotas.home,
      routes: {
        Rotas.home: (context) => const WidgetMenu(),
        Rotas.estado: (context) => const WidgetEstado(),
        Rotas.pessoa: (context) =>  WidgetPessoa(),
        Rotas.cadastroPessoa: (context) => const CadastroPessoa(),
      },
      // 
    );
  }
}
