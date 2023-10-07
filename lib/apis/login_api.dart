import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_session_manager/flutter_session_manager.dart';

class User {
  String name;
  String password;
  String email;
  String id;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  static Future<User> get() async {
    final  userjson = await SessionManager().get("User");
    User user = User.fromJson(userjson);

    return user;
  }

  

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
  static Future<bool> createUserAsync(Map<String, dynamic> json) async {
    Uri url = Uri.parse('https://cookinraj.vercel.app/signin');

    try {
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };

      final body = jsonEncode(json);
    
      final response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        debugPrint(response.body);
        await SessionManager().set("User", User.fromJson(jsonDecode(response.body)));
        return true;
      } else {
        // Handle the response based on the status code.
        debugPrint('Failed with status code ${response.statusCode}');
        debugPrint('Response data: ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }
  static Future<bool> authenticateUserAsync(
      Map<String, dynamic> json, String route) async {
    Uri url = Uri.parse('https://cookinraj.vercel.app/$route');

    try {
      final headers = <String, String>{
        'Content-Type': 'application/json',
      };

      final body = jsonEncode(json);

      final response = await http.put(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        await SessionManager().set("User", User.fromJson(jsonDecode(response.body)));
        return true;
      } else {
        // Handle the response based on the status code.
        debugPrint('Failed with status code ${response.statusCode}');
        debugPrint('Response data: ${response.body}');
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      return false;
    }
  }

  static void showFlashError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Content(message: message),
        backgroundColor: const Color.fromARGB(255, 188, 32, 21),
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,
        clipBehavior: Clip.none,
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String message;
  const Content({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30, // Adjust the height as needed
      child: Row(
        children: [
          const Icon(Icons.error, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
