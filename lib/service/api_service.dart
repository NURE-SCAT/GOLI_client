import 'package:http/http.dart' as http;
import '../models/http_exception.dart';

/*Singleton service for work with api*/
class ApiService {
  static final ApiService _singleton = ApiService._internal();

  final String _root = "https://dev-goli.herokuapp.com";

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'token': "6eefe8d7e0419b12a39bdb8994d3f0fff86c6514",
  };

  factory ApiService() {
    return _singleton;
  }

  ApiService._internal();

  /* request templates */
  Future<String> doGet(String route, Map<String, String> headers,
      Map<String, dynamic> body, int expectedStatus) async {
    String params = "?";

    body.forEach((key, value) {
      params += "$key=$value&";
    });

    // remove last & or ?(if no parameters)
    params = params.substring(0, params.length - 1);

    final url = "$_root/$route$params";

    final response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == expectedStatus) {
      return response.body;
    }

    throw HttpException("Get error!");
  }

  Future<String> doPost(String route, Map<String, String> headers, String body,
      int expectedStatus) async {
    final url = "$_root/$route";
    final response = await http.post(url, headers: headers, body: body);

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == expectedStatus) {
      return response.body;
    }

    throw HttpException("Post error!");
  }

  Future<String> doPut(String route, Map<String, String> headers, String body,
      int expectedStatus) async {
    final url = "$_root/$route";
    final response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == expectedStatus) {
      return response.body;
    }

    throw HttpException("Put error!");
  }

  Future<bool> doDelete(
      String route, Map<String, String> headers, int expectedStatus) async {
    final String url = '$_root/$route';
    final response = await http.delete(url, headers: headers);
    if (response.statusCode == expectedStatus) {
      return true;
    }

    return false;
  }
}
