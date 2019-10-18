import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('Transferências',),),
    body: ListaTransferencias(),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: null,
    ),
  ),
));

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      ItemTransferencia(Transferencia(100.0, '1000')),
      ItemTransferencia(Transferencia(200.0, '1002')),
      ItemTransferencia(Transferencia(300.0, '2000')),
    ],);
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia._valor.toString()),
        subtitle: Text(_transferencia._numeroDaConta),
      ),
    );
  }

}

class Transferencia {
  final double _valor;
  final String _numeroDaConta;

  Transferencia(this._valor, this._numeroDaConta);
}

