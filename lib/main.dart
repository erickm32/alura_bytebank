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
  final TextEditingController _accountNumberTextController =
      TextEditingController();
  final TextEditingController _valueTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência')),
      body: Column(
        children: <Widget>[
          Editor(
            controller: _accountNumberTextController,
            hintText: '0000',
            labelText: 'Número da Conta',
          ),
          Editor(
            controller: _valueTextController,
            hintText: '00.0',
            labelText: 'Valor',
            icon: Icons.monetization_on,
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () => _createTransfer(context),
          )
        ],
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    debugPrint('button click');
    final int accountNumber = int.tryParse(_accountNumberTextController.text);
    final double value = double.tryParse(_valueTextController.text);

    if (accountNumber != null && value != null) {
      final Transferencia t = Transferencia(value, accountNumber);
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('$t')));
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData icon;

  Editor({this.controller, this.labelText, this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: labelText,
          hintText: hintText,
        ),
        keyboardType: TextInputType.number,
      ),
      padding: const EdgeInsets.all(16.0),
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

  @override
  String toString() {
    return 'Transferencia de $_valor para $_numeroDaConta.';
  }
}
