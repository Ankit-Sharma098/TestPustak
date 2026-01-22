import 'package:flutter/material.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _newPassCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _newPassObscure = true;
  bool _confirmPassObscure = true;

  final _passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
            (route) => false,
      );
    }
  }

  @override
  void dispose() {
    _newPassCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              // 🔹 NEW PASSWORD
              TextFormField(
                controller: _newPassCtrl,
                obscureText: _newPassObscure,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _newPassObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _newPassObscure = !_newPassObscure;
                      });
                    },
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Password is required';
                  }
                  if (!_passwordRegex.hasMatch(v)) {
                    return 'Password must contain:\n'
                        '• Uppercase letter\n'
                        '• Lowercase letter\n'
                        '• Number\n'
                        '• Special character\n'
                        '• Minimum 8 characters';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // 🔹 CONFIRM PASSWORD
              TextFormField(
                controller: _confirmPassCtrl,
                obscureText: _confirmPassObscure,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _confirmPassObscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        _confirmPassObscure = !_confirmPassObscure;
                      });
                    },
                  ),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return 'Confirm your password';
                  }
                  if (v != _newPassCtrl.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _changePassword,
                child: const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
