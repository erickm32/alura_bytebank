class Transfer {
  final double _value;
  final int _accountNumber;

  Transfer(this._value, this._accountNumber);

  get value => _value;
  get accountNumber => _accountNumber;

  @override
  String toString() {
    return 'Transferencia de $_value para $_accountNumber.';
  }
}