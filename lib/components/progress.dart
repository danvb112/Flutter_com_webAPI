

import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String textLoading;

  Progress({this.textLoading = 'Loading'});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LinearProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(textLoading, style: TextStyle(fontSize: 16),),
                  )
                ],
              ),
            );
  }

}