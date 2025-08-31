import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:5135/api";

  static Future<Map<String, dynamic>> callWebApi({
    required String endpoint,
    required String method,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse("$baseUrl/$endpoint");

    http.Response response;

    switch (method.toUpperCase()) {
      case "POST":
        response = await http.post(
          url,
          headers: headers ?? {"Content-Type": "application/json"},
          body: jsonEncode(body),
        );
        break;
      case "GET":
        response = await http.get(
          url,
          headers: headers ?? {"Content-Type": "application/json"},
        );
        break;
      case "PUT":
        response = await http.put(
          url,
          headers: headers ?? {"Content-Type": "application/json"},
          body: jsonEncode(body),
        );
        break;
      case "DELETE":
        response = await http.delete(
          url,
          headers: headers ?? {"Content-Type": "application/json"},
        );
        break;
      default:
        throw Exception("HTTP method not supported");
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed request: ${response.statusCode}");
    }
  }
}
