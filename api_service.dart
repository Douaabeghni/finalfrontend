import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = "http://192.168.1.16:5000";

  Future<List<dynamic>> getItems() async {
    final response = await http.get(Uri.parse('$baseUrl/items'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('فشل تحميل العناصر');
    }
  }

  // إرسال عنصر جديد (مثال)
  Future<bool> postItem(Map<String, dynamic> item) async {
    final response = await http.post(
      Uri.parse('$baseUrl/items'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(item),
    );

    return response.statusCode == 201;
  }

  // تسجيل الدخول
  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'), // غيّر الرابط حسب API تاعك
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );

    return response.statusCode == 200;
  }

  // تسجيل حساب جديد
  Future<bool> signup(String username, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/signup'), // غيّر الرابط إذا لزم الأمر
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "email": email,
        "password": password,
      }),
    );

    print("Signup status code: ${response.statusCode}");
    print("Signup response body: ${response.body}");

    return response.statusCode == 200 || response.statusCode == 201;
  }
}
