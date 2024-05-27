import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/views/auth/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../component/default_formField.dart';
import '../../controllers/auth/login_controller.dart';
import '../../helpers/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    LoginController loginController =Get.put(LoginController(),);
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defultFormField(
                    controller:LoginController().emailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter ur email address';
                      }
                    },
                    label: 'Email Address',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defultFormField(
                    controller: LoginController().passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Password is to short';
                      }
                    },
                    label: 'Password',
                    prefix: Icons.lock,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  DefaultButton(
                    title: 'Login',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                            email: LoginController().emailController.text;
                            password: LoginController().passwordController.text;
                            final SharedPreferences? prefs =await _prefs;
                            print(prefs?.get('token'),);
                      }
                    },
                    buttonWidth: double.infinity,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont have an account?'),
                      TextButton(
                        onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  RegisterPage(),
                          ),
                        );},
                        child: const Text(
                          'Register Now',
                          style: TextStyle(
                            color: AppColors.primary,
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
    );
  }
}
