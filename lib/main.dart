import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência')),
      body: Column(children: <Widget>[
        Padding(
          child: TextField(
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              labelText: 'Número da Conta',
              hintText: '0000'
            ),
            keyboardType: TextInputType.number,),
          padding: const EdgeInsets.all(16.0),
        ),
        Padding(
          child: TextField(
            style: TextStyle(fontSize: 24.0),
            decoration: InputDecoration(
              labelText: 'Valor',
              hintText: '0.00'
            ),
            keyboardType: TextInputType.number,
          ),
          padding: const EdgeInsets.all(16.0),
        ),
        RaisedButton(
          child: Text('Confirmar'),
        )
      ],)
      ,
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências')),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 1002)),
          ItemTransferencia(Transferencia(300.0, 2000)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
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
        subtitle: Text(_transferencia._numeroDaConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double _valor;
  final int _numeroDaConta;

  Transferencia(this._valor, this._numeroDaConta);
}
