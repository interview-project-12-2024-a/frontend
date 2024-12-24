import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/stores/auth_store.dart';
import 'package:frontend/app/modules/chat/controllers/chat_controller.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthStore authStore = Modular.get<AuthStore>();
  final ChatController chatController = Modular.get<ChatController>();

  Future<User?> login(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      authStore.setIdToken(await userCredential.user?.getIdToken());
      authStore.setEmail(userCredential.user?.email);

      await chatController.getChatList();

      return userCredential.user;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<User?> register(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Registration failed: $e');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } catch (e) {
      throw Exception('Password reset failed: $e');
    }
  }
}
