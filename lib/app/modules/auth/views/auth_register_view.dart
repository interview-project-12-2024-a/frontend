import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:frontend/app/modules/auth/controllers/auth_controller.dart';

class AuthRegisterView extends StatefulWidget {
  AuthController authController = AuthController();
  @override
  _AuthRegisterViewState createState() => _AuthRegisterViewState();
}

class _AuthRegisterViewState extends State<AuthRegisterView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool isLoading = false;

  void register() async {
    if (passwordController.text.trim() !=
        confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: const Text('Passwords do not match')));
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await widget.authController
          .register(emailController.text, passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('The email has been registered')));
      Modular.to.navigate('/chat');
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
      appBar: AppBar(title: const Text('Register')),
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
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: register,
                    child: const Text('Register'),
                  ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => Modular.to.navigate('/'),
              child: const Text('Already have an account? Log in here'),
            ),
          ],
        ),
      ),
    );
  }
}
