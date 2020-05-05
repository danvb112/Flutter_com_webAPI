import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/loggin_interceptor.dart';

final Client client =
    HttpClientWithInterceptor.build(
      interceptors: [LogginInterceptor()],
      requestTimeout: Duration(seconds: 10),
    );

final String baseUrl = 'http://192.168.15.2:8080/transactions';
