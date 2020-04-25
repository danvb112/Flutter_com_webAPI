import 'package:flutter/material.dart';
import 'package:fluttercompd/components/centered_message.dart';
import 'package:fluttercompd/components/progress.dart';
import 'package:fluttercompd/http/webclient.dart';

import 'package:fluttercompd/models/transaction.dart';

class TransactionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
        ),
        body: FutureBuilder<List<Transaction>>(
            future: findAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    final List<Transaction> transactions = snapshot.data;
                    if (transactions.isNotEmpty) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final Transaction transaction = transactions[index];
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.monetization_on),
                              title: Text(
                                transaction.value.toString(),
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                transaction.contact.accountNumber.toString(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: transactions.length,
                      );
                    } else {
                      return CenteredMessage('Transaction not found',
                          icon: Icons.warning);
                    }
                  }

                  break;
              }
              return CenteredMessage('Unknow Error');
            }));
  }
}
