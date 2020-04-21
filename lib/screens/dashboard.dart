import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompd/screens/contacts_list.dart';
import 'package:fluttercompd/screens/transactions_list.dart';
import 'package:path/path.dart';

class Dashboard extends StatelessWidget {
  static const String _titleAppBar = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBar)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                _FeatureItem('Transfer', Icons.monetization_on, onCLick: () => _showContactsList(context)),
                _FeatureItem('Transaction feed', Icons.description, onCLick: () => _showTransactionFeed(context),),
                _FeatureItem('Teste', Icons.ac_unit)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showTransactionFeed(BuildContext context){
  Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionsList() ));

}


void _showContactsList(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => ContactsList()));
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onCLick;

  _FeatureItem(this.name, this.icon, {@required this.onCLick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            onCLick();
          },
          child: Container(
              height: 100,
              width: 150,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  ])),
        ),
      ),
    );
  }
}
