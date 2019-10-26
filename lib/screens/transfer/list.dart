import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:flutter/material.dart';

class TransfersList extends StatefulWidget {
  final List<Transfer> _transfers = List();

  @override
  State<StatefulWidget> createState() {
    return TransfersListState();
  }
}

class TransfersListState extends State<TransfersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências')),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (context, index) => TransferItem(widget._transfers[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _callCreateTransferForm(context),
      ),
    );
  }

  void _callCreateTransferForm(context) {
    final Future<Transfer> future =
        Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TransferForm();
    }));
    future.then((createdTransfer) {
      debugPrint('$createdTransfer');
      if (createdTransfer != null) {
        setState(() {
          widget._transfers.add(createdTransfer);
        });
      }
    });
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.accountNumber.toString()),
      ),
    );
  }
}