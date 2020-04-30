import 'dart:convert';

import 'package:fluttercompd/http/interceptors/loggin_interceptor.dart';
import 'package:fluttercompd/http/webclient.dart';
import 'package:fluttercompd/models/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';

class TransactionWebClient {
  final Client client =
      HttpClientWithInterceptor.build(interceptors: [LogginInterceptor()]);

  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }


  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': password,
        },
        body: transactionJson);

    if(response.statusCode == 200){
      return Transaction.fromJson(jsonDecode(response.body));
    }

    _throwHttpError(response.statusCode);
 
  }

  void _throwHttpError(int statusCode) => throw Exception(_statusCodeResponse[statusCode]);

  static final Map<int, String> _statusCodeResponse = {
      400: 'There is an error submitting transaction',
      401: 'Authentication faild',
    };
}
