import 'package:flutter/material.dart';
import 'package:fluttercompd/components/progress.dart';
import 'package:fluttercompd/dao/contacts_dao.dart';
import 'package:fluttercompd/models/contact.dart';
import 'package:fluttercompd/screens/transaction_form.dart';

import 'contact_form.dart';

class ContactsList extends StatelessWidget {

  static const String _titleAppBar = 'Transfer';
  static const String _textErro = 'Unknow error';

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: List(),
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              
              case ConnectionState.none:
                break;

              case ConnectionState.waiting:
                return Progress();
                break;

              case ConnectionState.active:
                break;

              case ConnectionState.done:
                final List<Contact> contacts = snapshot.data;
              return ListView.builder(
              itemBuilder: (context, index) {
                final Contact contact = contacts[index];
                return _ContactItem(contact, onClick: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionForm(contact)));
                });
              },
              itemCount: contacts.length,
            );   
                break;
            }

            return Text(_textErro);

          }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ContactForm(),
                ),
              );
    
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;
  final Function onClick;

  _ContactItem(this.contact, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
