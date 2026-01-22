import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'terms_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _stateCtrl = TextEditingController();

  bool _agree = false;
  bool _obscure = true;

  void _register() {
    if (_formKey.currentState!.validate() && _agree) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              _field(_nameCtrl, 'Full Name', Icons.person),
              _field(_phoneCtrl, 'Phone Number', Icons.phone,
                  keyboard: TextInputType.phone),
              _field(_emailCtrl, 'Email Address', Icons.email,
                  keyboard: TextInputType.emailAddress),
              _passwordField(),
              _field(_cityCtrl, 'City / District', Icons.location_city),
              _field(_stateCtrl, 'State', Icons.map),

              const SizedBox(height: 10),

              Row(
                children: [
                  Checkbox(
                    value: _agree,
                    onChanged: (v) => setState(() => _agree = v!),
                  ),
                  Expanded(
                    child: Wrap(
                      children: [
                        const Text('I agree with '),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const TermsScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Terms & Conditions',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: _agree ? _register : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  minimumSize: const Size(double.infinity, 45),
                ),
                child: const Text(
                  'Register Account',
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                    child: const Text('Login'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
      TextEditingController c,
      String label,
      IconData icon, {
        TextInputType keyboard = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: c,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (v) => v == null || v.isEmpty ? 'Required' : null,
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: TextFormField(
        controller: _passwordCtrl,
        obscureText: _obscure,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
            onPressed: () => setState(() => _obscure = !_obscure),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (v) =>
        v != null && v.length >= 6 ? null : 'Min 6 characters',
      ),
    );
  }
}
