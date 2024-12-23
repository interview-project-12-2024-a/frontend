import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/controllers/auth_controller.dart';

class AuthPasswordResetView extends StatefulWidget {
  AuthController authController = AuthController();
  @override
  _AuthPasswordResetViewState createState() => _AuthPasswordResetViewState();
}

class _AuthPasswordResetViewState extends State<AuthPasswordResetView> {
  final emailController = TextEditingController();
  bool isLoading = false;

  void resetPassword() async {
    setState(() {
      isLoading = false;
    });

    try {
      await widget.authController.resetPassword(emailController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: const Text('Password reset email sent! Check your inbox.'),
        ),
      );

      Modular.to.pop();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: resetPassword,
                    child: Text('Send Reset Email'),
                  ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Modular.to.navigate('/'),
              child: const Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
