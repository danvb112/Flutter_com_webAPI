import 'dart:convert';

import 'package:fluttercompd/http/webclient.dart';
import 'package:fluttercompd/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {

  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }


  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 2));

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if(response.statusCode == 200){
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
 
  }

  String _getMessage(int statusCode) {
    if(_statusCodeResponse.containsKey(statusCode)){
      return _statusCodeResponse[statusCode];
    }
    return 'Unknow error';
  }


  static final Map<int, String> _statusCodeResponse = {
      400: 'There is an error submitting transaction',
      401: 'Authentication faild',
      409: 'Transaction always exists'
    };
}


class HttpException implements Exception {
  
  final String message;

  HttpException(this.message);

}
