import 'package:flutter/material.dart';
import 'package:aglow_farms/utils/colors.dart';

class AuthShell extends StatelessWidget {
  const AuthShell({
    super.key,
    required this.title,
    required this.subtitle,
    required this.form,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    this.footer,
  });

  final String title;
  final String subtitle;
  final Widget form; // your TextFormFields go here
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Logo
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4, bottom: 16),
                      child: Image.asset(
                        'assets/logo.png',
                        height: 56,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Title + subtitle
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Form section
                  form,
                  const SizedBox(height: 20),
                  // Primary button
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BLUE,
                        foregroundColor: WHITE,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 0,
                      ),
                      onPressed: onPrimaryPressed,
                      child: Text(
                        primaryLabel,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  if (footer != null) ...[
                    const SizedBox(height: 16),
                    Center(child: footer!),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
