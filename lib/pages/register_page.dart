import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                print('Attempting to register...');
                try {
                  await authController.register(
                    _emailController.text,
                    _passwordController.text,
                  );

                  // Periksa apakah pendaftaran berhasil
                  if (authController.user != null) {
                    print('Registration successful, navigating to home page.');
                    // Arahkan ke halaman home
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    print('Registration failed: No user returned.');
                    // Tampilkan pesan kesalahan
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration failed')),
                    );
                  }
                } catch (error) {
                  // Tangani kesalahan yang mungkin terjadi
                  print('Error during registration: $error');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('An error occurred: $error')),
                  );
                }
              },
              child: Text('Register'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
