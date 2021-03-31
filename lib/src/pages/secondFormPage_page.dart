import 'package:app_prac/src/pages/formulario_page.dart';
import 'package:flutter/material.dart';

class SecondFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Argumentos parametros = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tus datos en LinkShop'),
        ),
        body: Center(
          child: Text(
              'Tu nombre es ${parametros.nombreCom} y tu número de cuenta es ${parametros.numCuenta}, por último tu NIP secreto es ${parametros.nip}'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
