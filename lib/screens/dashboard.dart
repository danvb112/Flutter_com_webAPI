import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompd/screens/contacts_list.dart';

class Dashboard extends StatelessWidget {

  static const String _titleAppBar = 'Dashboard';
  static const String _textContainer = 'Transfer';

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
          Row(
            children: <Widget>[
              _FeatureItem('Transfer', Icons.monetization_on),
              _FeatureItem('Transaction feed', Icons.description)
              
            ],
          ),
          
        ],
      ),
    );
  }
}


class _FeatureItem extends StatelessWidget{

  final String name;
  final IconData icon;

  _FeatureItem(this.name, this.icon);




  @override
  Widget build(BuildContext context) {
   
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactsList()));
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
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          )
                        ])),
              ),
            ),
          );
  }

}
