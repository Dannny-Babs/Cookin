import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  String name;
  String password;
  String email;

  User({
    required this.name,
    required this.email,
    required this.password,
  });

  

  static Future<User> createUserAsync(Map<String, dynamic> json, String route) async {
    Uri url = Uri.parse('https://cookinraj.vercel.app/$route');

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
        // Successful POST request.
        debugPrint('Response data: ${response.body}');
        // You can return a User object here if needed.
        return User(
          name: json['name']?? "",
          email: json['email'],
          password: json['password'],
        );
      } else {
        // Handle the response based on the status code.
        debugPrint('Failed with status code ${response.statusCode}');
        debugPrint('Response data: ${response.body}');
        throw Exception('Failed with status code ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors or exceptions.
      debugPrint('Error: $e');
      throw Exception('Network error: $e');
    }
  }
}
