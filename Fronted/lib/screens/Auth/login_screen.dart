import 'dart:async';
import 'package:flutter/material.dart';
import '../Home/home_screen.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isObscure = true;
  bool _isLoading = false;
  bool _isSuccess = false;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);

      await Future.delayed(const Duration(milliseconds: 1500));

      setState(() {
        _isLoading = false;
        _isSuccess = true;
      });

      await Future.delayed(const Duration(milliseconds: 400));

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    }
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: _isSuccess ? 0.0 : 1.0,
          duration: const Duration(milliseconds: 400),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // 🔹 LOGO
                    Center(
                      child: Image.asset(
                        'assets/images/testpustak.jpg',
                        height: 150,
                        errorBuilder: (_, __, ___) =>
                        const Icon(Icons.school, size: 80),
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Login to continue your preparation',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.indigo),
                    ),

                    const SizedBox(height: 40),

                    // 🔹 EMAIL / MOBILE FIELD
                    TextFormField(
                      controller: _mobileController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email or Mobile Number',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      // 🔥 LIMIT MOBILE TO 10 DIGITS IF NUMERIC
                      onChanged: (value) {
                        if (RegExp(r'^\d+$').hasMatch(value)) {
                          if (value.length > 10) {
                            _mobileController.text = value.substring(0, 10);
                            _mobileController.selection =
                            TextSelection.fromPosition(
                              TextPosition(offset: 10),
                            );
                          }
                        }
                      },

                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter Email or Mobile Number';
                        }

                        final input = value.trim();
                        final isNumeric =
                        RegExp(r'^\d+$').hasMatch(input);

                        final mobileRegex = RegExp(r'^[6-9]\d{9}$');
                        final emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        );

                        if (isNumeric) {
                          if (!mobileRegex.hasMatch(input)) {
                            return 'Enter valid 10-digit mobile number';
                          }
                        } else {
                          if (!emailRegex.hasMatch(input)) {
                            return 'Enter valid email address';
                          }
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // 🔹 PASSWORD FIELD
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () =>
                              setState(() => _isObscure = !_isObscure),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter password';
                        }
                        if (value.length < 8) {
                          return 'Min 8 characters required';
                        }
                        if (!RegExp(r'[A-Z]').hasMatch(value)) {
                          return 'Add one uppercase letter';
                        }
                        if (!RegExp(r'[a-z]').hasMatch(value)) {
                          return 'Add one lowercase letter';
                        }
                        if (!RegExp(r'[0-9]').hasMatch(value)) {
                          return 'Add one number';
                        }
                        if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
                          return 'Add one special character';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 10),

                    // 🔹 FORGOT PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                              const ForgotPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔹 LOGIN BUTTON
                    ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      style: ElevatedButton.styleFrom(
                        padding:
                        const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: _isLoading
                          ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2.5,
                        ),
                      )
                          : const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // 🔹 SIGN UP
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
