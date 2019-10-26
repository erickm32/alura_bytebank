import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _accountNumberTextController =
      TextEditingController();
  final TextEditingController _valueTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criando Transferência')),
      body: SingleChildScrollView(
        child: Column(
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
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    debugPrint('button click');
    final int accountNumber = int.tryParse(_accountNumberTextController.text);
    final double value = double.tryParse(_valueTextController.text);

    if (accountNumber != null && value != null) {
      final Transfer t = Transfer(value, accountNumber);
      Navigator.pop(context, t);
    }
  }
}