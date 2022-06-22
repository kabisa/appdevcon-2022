import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_workshop/data/transaction.dart';
import 'package:flutter_workshop/data/transactions.dart';
import 'package:flutter_workshop/support/form_validators.dart';
import 'package:provider/provider.dart';

class NewTransactionScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final VoidCallback onTransactionCreated;

  NewTransactionScreen({Key key, @required this.onTransactionCreated})
      : super(key: key);

  Transaction _buildTransaction(NewTransactionFormData formData) {
    return Transaction(
        fromName: "I",
        toName: formData.receivers,
        kudos: formData.kudos,
        note: formData.message,
        createdAt: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Award ₭udos")),
      body: Padding(
          padding: EdgeInsets.all(16),
          child: Consumer<Transactions>(
            builder: (context, transactions, _) => NewTransactionForm(
                formKey: _formKey,
                onSubmit: (formData) {
                  transactions.add(_buildTransaction(formData));
                  onTransactionCreated();

                  Navigator.of(context).pop();
                }),
          )),
    );
  }
}

class NewTransactionFormData {
  int kudos;
  String receivers;
  String message;

  @override
  String toString() {
    return 'NewTransactionFormData{kudos: $kudos, receivers: $receivers, message: $message}';
  }
}

class NewTransactionForm extends StatefulWidget {
  final GlobalKey<FormState> _formKey;
  final Function(NewTransactionFormData) onSubmit;

  const NewTransactionForm({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.onSubmit,
  })  : _formKey = formKey,
        super(key: key);

  @override
  _NewTransactionFormState createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final NewTransactionFormData _data = NewTransactionFormData();
  final FocusNode _focusNode = FocusNode();

  void _submit() {
    if (widget._formKey.currentState.validate()) {
      widget._formKey.currentState.save();
      widget.onSubmit(this._data);
    }
  }

  void _onKey(RawKeyEvent event) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.enter &&
        event.isMetaPressed) {
      _submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    /* RawKeyboardListener is desktop-specific and can be ignored for the purpose of this workshop! */
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: _onKey,
      child: Form(
        key: widget._formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money),
                hintText: 'Amount of kudos',
              ),
              validator: FormValidators.greaterThan(0),
              onSaved: (value) => _data.kudos = num.parse(value),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.people),
                  hintText: 'Receivers',
                ),
                validator: FormValidators.required,
                onSaved: (value) => _data.receivers = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: TextFormField(
                minLines: 3,
                maxLines: 5,
                decoration: const InputDecoration(
                  icon: Icon(Icons.message),
                  hintText: 'Message',
                ),
                validator: FormValidators.required,
                onSaved: (value) => _data.message = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 40),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: _submit,
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
