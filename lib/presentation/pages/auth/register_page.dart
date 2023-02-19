import 'package:flutter/material.dart';
import 'package:photo_social_network/app/config/app_string.dart';
import 'package:photo_social_network/app/config/app_text_style.dart';
import 'package:photo_social_network/presentation/common/app_back_button.dart';
import 'package:photo_social_network/presentation/common/button/dark_button.dart';
import 'package:photo_social_network/presentation/common/form/commom_text_form_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const Text(
            AppString.registerCs,
            style: AppTextStyle.comfortaaBlackW400doubleExtraLarge,
          ),
          const SizedBox(height: 25),
          CommomTextFormField(
            controller: _emailController,
            validator: (_) => null,
            hintText: AppString.email,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CommomTextFormField(
              controller: _passwordController,
              validator: (_) => null,
              hintText: AppString.password,
              obscureText: true,
              action: TextInputAction.done,
            ),
          ),
          DarkButton(text: AppString.nextUs, onPressed: () {}),
        ],
      ),
    );
  }
}
