import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/stores/auth_store.dart';
import 'package:http/http.dart' as http;

class WebService {
  final String backend = "https://backend-560652914450.us-central1.run.app";

  AuthStore authStore = Modular.get<AuthStore>();

  Future<dynamic> post(String endpoint, dynamic data) async {
    final url = Uri.parse('$backend$endpoint');

    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${authStore.idToken}',
        'Content-Type': 'application/json'
      },
      body: data.toJson(),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('POST request failed for endpoint $endpoint');
    }
  }

  Future<dynamic> get(String endpoint) async {
    final url = Uri.parse('$backend$endpoint');

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer ${authStore.idToken}'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('GET request failed for endpoint $endpoint');
    }
  }
}
