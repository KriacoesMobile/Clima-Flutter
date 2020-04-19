import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<dynamic> getData() async {
    try {
      http.Response response = await http.get(url);
      return jsonDecode(response.body);
    } catch (exception) {
      print(exception);
    }
  }
}
