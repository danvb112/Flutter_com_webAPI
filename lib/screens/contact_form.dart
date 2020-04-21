
import 'package:flutter/material.dart';
import 'package:fluttercompd/dao/contacts_dao.dart';

import 'package:fluttercompd/models/contact.dart';

class ContactForm extends StatefulWidget {

  

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  final ContactDao _dao = ContactDao();

  static const String _textAppBar = 'New contact';
  static const String _fullName = 'Full name';
  static const String _accountNumber = 'Account number';
  static const String _textButton = 'Create';
  static const String _nameTip = 'Daniel';
  static const String _accountTip = '0000';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_textAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: _fullName,
                hintText: _nameTip
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: _accountNumber,
                  hintText: _accountTip
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text(_textButton),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, accountNumber);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                    
                    
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
