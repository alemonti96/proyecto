import 'package:flutter_application_proyecto/src/providers/menu_provider.dart';
import 'package:flutter_application_proyecto/src/utils/icono_string_util.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      appBar: AppBar(
        title: Text('componentes'),
      ),
      body: _lista( context ),
    );
   
  }

  Widget _lista(BuildContext context){
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView(
          children:  _listaItems(snapshot.data, context),
          );
      },
    );
  }
  List<Widget> _listaItems(List<dynamic> data, BuildContext context){
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: Colors.lightBlueAccent,
        ),
        onTap: (){
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopUpDialog(context, opt['texto']),
          );
        },
      );
      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
  Widget _buildPopUpDialog(BuildContext context, String opt) {
    return new AlertDialog(
      title: const Text('Diste click'),
      content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Soy una Opcion  '+ opt),
      ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Cerrar'),
        )
      ],
    );
  }
}