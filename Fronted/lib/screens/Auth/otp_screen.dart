import 'dart:async';
import 'package:flutter/material.dart';
import 'reset_password_screen.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();

  static const int _totalTime = 300; // 5 minutes = 300 sec
  int _remainingTime = _totalTime;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _remainingTime = _totalTime;
    _canResend = false;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        timer.cancel();
        setState(() {
          _canResend = true;
        });
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void _resendOtp() {
    // 🔹 Here you will call RESEND OTP API later
    _startTimer();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP resent successfully')),
    );
  }

  void _verifyOtp() {
    if (_otpController.text.length == 6) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter valid 6-digit OTP')),
      );
    }
  }

  String _formatTime(int seconds) {
    final min = seconds ~/ 60;
    final sec = seconds % 60;
    return '$min:${sec.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Enter the 6-digit OTP sent to your mobile',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'OTP',
                counterText: '',
              ),
            ),

            const SizedBox(height: 16),

            !_canResend
                ? Text(
              'Resend OTP in ${_formatTime(_remainingTime)}',
              style: const TextStyle(color: Colors.grey),
            )
                : GestureDetector(
              onTap: _resendOtp,
              child: const Text(
                'Resend OTP',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _verifyOtp,
              child: const Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
