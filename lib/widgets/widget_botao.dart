import 'package:flutter/material.dart';

class WidgetBotao extends StatelessWidget{

  final String rota;
  final String rotulo;
  const WidgetBotao({super.key, required this.rota, required this.rotulo});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.pushNamed(context, rota);
    }, child: Text(rotulo));
  }
}