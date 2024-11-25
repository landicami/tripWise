import 'package:flutter/material.dart';
import 'package:tripwise/services/auth_service.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  String? _errorFeedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: const Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),

              // intro text
              const Center(
                child: Text(
                  'Enter your email to reset password',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16.0),

              // email address
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // error feedback
              if (_errorFeedback != null)
                Text(
                  _errorFeedback!,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 16.0),

              // submit button
              FilledButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _errorFeedback = null;
                    });

                    final email = _emailController.text.trim();
                    final scaffoldContext = ScaffoldMessenger.of(
                        context); // Spara context innan async
                    final navigator = Navigator.of(context);

                    try {
                      await AuthService.forgotPassword(email);
                    } catch (e) {
                      // Log error internally men visa inget specifikt fel för användaren
                      // print('Internal error logged: $e');
                    }

                    if (!mounted) return;

                    // Visa alltid samma meddelande oavsett om mailen finns eller inte
                    scaffoldContext.showSnackBar(
                      const SnackBar(
                        content: Text(
                            "We've sent you a password reset link to the provided email (if the email has an account)."),
                      ),
                    );
                    navigator.pop();
                  }
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Reset Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
