import 'package:aglow_farms/features/auth/signup/view/signup.dart';

import 'package:aglow_farms/utils/bottom_nav.dart';
import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/utils/custom_textfiled.dart';
import 'package:aglow_farms/utils/navigator.dart';
import 'package:flutter/material.dart';

import 'widgets /auth_shell.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _pwdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: 'Welcome back',
      subtitle: "Sign in to manage your farm product orders with ease.",
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            // Email or Username
            CustomTextField(
              label: 'Email or Username',
              hint: 'you@example.com',
              controller: _emailCtrl,
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Enter your email or username'
                  : null,
              textInputAction: TextInputAction.next,
              prefixIcon: Icon(Icons.email_outlined),
            ),
            const SizedBox(height: 16),
            // Password
            CustomPasswordField(
              label: 'Password',
              controller: _pwdCtrl,
              textInputAction: TextInputAction.done,
              validator: (v) =>
                  (v == null || v.length < 6) ? 'Min 6 characters' : null,
            ),
            const SizedBox(height: 8),
            // Forgot password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(foregroundColor: BLUE),
                onPressed: () {
                  // TODO: navigate to Forgot Password
                },
                child: const Text('Forgot password?'),
              ),
            ),
          ],
        ),
      ),
      primaryLabel: 'Log In',
      onPrimaryPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // TODO: hook up real auth
          customNavigator(context, const BottomNav());
        }
      },
      footer: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text("Don't have an account? "),
          InkWell(
            onTap: () => customNavigator(context, const Register()),
            child: Text(
              'Sign up',
              style: TextStyle(color: BLUE, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
