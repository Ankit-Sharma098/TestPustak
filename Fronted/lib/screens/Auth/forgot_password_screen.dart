import 'package:flutter/material.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _getOtp() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const OtpScreen()),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Password')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Enter your Mobile Number or Email',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 24),

              TextFormField(
                controller: _controller,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number or Email',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),

                // 🔥 IMPORTANT PART
                onChanged: (value) {
                  // Agar user sirf number type kar raha hai
                  if (RegExp(r'^\d+$').hasMatch(value)) {
                    if (value.length > 10) {
                      _controller.text = value.substring(0, 10);
                      _controller.selection = TextSelection.fromPosition(
                        const TextPosition(offset: 10),
                      );
                    }
                  }
                },

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Mobile number or Email is required';
                  }

                  final input = value.trim();

                  final isNumeric = RegExp(r'^\d+$').hasMatch(input);
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

                  return null; // ✅ valid
                },
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: _getOtp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Get OTP',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
