import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // TextEditingController nombreTextController;
  //TextEditingController apTextController;

  FocusNode nombreComFocus;
  FocusNode numCuentaFocus;
  FocusNode nipFocus;

  String nombreCom;
  String numCuenta;
  String nip;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registrate en LinkShop'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.coronavirus, color: Colors.pink),
                Icon(Icons.coronavirus, color: Colors.pink),
                Image(
                  image: NetworkImage(
                      'https://assets.entrepreneur.com/content/3x2/2000/20180214175108-ecommerce.jpeg?width=700&crop=2:1'),
                  height: 150.0,
                ),
                Icon(Icons.coronavirus, color: Colors.pink),
                Text(
                  'Bienvenido a Link Shop',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                  ),
                ),
                Icon(Icons.coronavirus, color: Colors.pink),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Escribe tu nombre completo',
                      hintText: 'Ejemplo: Alain Berber Álvarez',
                      prefixIcon: Icon(Icons.person_pin)),
                  onSaved: (value) {
                    nombreCom = value;
                  },

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo no puede estar vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.nombreComFocus,
                  onEditingComplete: () =>
                      requestFocus(context, numCuentaFocus),
                  textInputAction: TextInputAction.next,
                  // autofocus: true,
                  // controller: nombreTextController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Tu número de cuenta bancaria',
                      hintText: 'Ejemplo: 4152 3134 xxxx xxxxx',
                      prefixIcon: Icon(Icons.attach_money)),
                  onSaved: (value) {
                    numCuenta = value;
                  },

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo no puede estar vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.numCuentaFocus,
                  onEditingComplete: () => requestFocus(context, nipFocus),
                  textInputAction: TextInputAction.next,
                  //   autofocus: true,
                  //   controller: apTextController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Ahora teclea tu NIP',
                      hintText: 'Ejemplo: xxxx',
                      prefixIcon: Icon(Icons.security)),
                  onSaved: (value) {
                    nip = value;
                  },

                  validator: (value) {
                    if (value.isEmpty) {
                      return 'El campo no puede estar vacio';
                    } else {
                      return null;
                    }
                  },
                  focusNode: this.nipFocus,
                  //   autofocus: true,
                  //   controller: apTextController,
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (nip.compareTo('7070') == 0 &&
                            numCuenta.compareTo('4152415241524152') == 0) {
                          Navigator.pushNamed(context, 'formulario_dos',
                              arguments: Argumentos(
                                  nombreCom: this.nombreCom,
                                  numCuenta: this.numCuenta,
                                  nip: this.nip));
                        }
                      } else {
                        print('Datos incorrectos');
                      }
                    },
                    child: Text('Registrar')),
                Text(
                    'Debes de registrar los datos, todos tus datos serán guardados de manera encriptada'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //String validarCampo(var valor) {
  //  if (valor.isEmpty) {
  //    return 'Este campo no puede quedar vacio';
  //   }
//  }

  void requestFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  void initState() {
    super.initState();
    //nombreTextController = TextEditingController();
    //apTextController = TextEditingController();
    nombreComFocus = FocusNode();
    numCuentaFocus = FocusNode();
    nipFocus = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    // nombreTextController.dispose();
    // apTextController.dispose();
    nombreComFocus.dispose();
    numCuentaFocus.dispose();
    nipFocus.dispose();
  }
}

class Argumentos {
  String nombreCom;
  String numCuenta;
  String nip;

  Argumentos({this.nombreCom, this.numCuenta, this.nip});
}
