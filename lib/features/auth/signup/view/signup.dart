import 'package:aglow_farms/utils/colors.dart';
import 'package:aglow_farms/utils/navigator.dart';
import 'package:flutter/material.dart';
import '../../../../utils/custom_textfiled.dart';
import '../../login/view/login.dart';
import '../../login/view/widgets /auth_shell.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _bizCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();
  bool _obscure = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _bizCtrl.dispose();
    _pwdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthShell(
      title: 'Join Aglow Farms',
      subtitle: 'Sign up to manage your farm product orders with ease.',
      form: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              label: 'Full Name',
              hint: 'John Doe',
              controller: _nameCtrl,
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.person_outline),
              validator: (v) => (v == null || v.trim().isEmpty)
                  ? 'Enter your full name'
                  : null,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Phone Number',
              hint: '+233 20 000 0000',
              controller: _phoneCtrl,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.phone_outlined),
              validator: (v) =>
                  (v == null || v.trim().isEmpty) ? 'Enter phone number' : null,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              label: 'Business Name ',
              hint: 'Aglow Supply Co.',
              controller: _bizCtrl,
              textInputAction: TextInputAction.next,
              prefixIcon: const Icon(Icons.store_mall_directory_outlined),
            ),
            const SizedBox(height: 16),

            CustomPasswordField(
              label: 'Password',
              controller: _pwdCtrl,
              textInputAction: TextInputAction.done,
              validator: (v) =>
                  (v == null || v.length < 6) ? 'Min 6 characters' : null,
            ),
          ],
        ),
      ),
      primaryLabel: 'Sign Up',
      onPrimaryPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          // TODO: call signup, then go to dashboard or OTP, etc.
          Navigator.pop(context); // go back or push next
        }
      },
      footer: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text('Already have an account? '),
          InkWell(
            onTap: () => customNavigator(context, const Login()),
            child: Text(
              'Log in',
              style: TextStyle(color: BLUE, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
