import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:miniso/component/default_button.dart';
import 'package:miniso/controllers/auth/registration_controller.dart';

import '../../component/default_formField.dart';
import '../../helpers/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var firstNameController = TextEditingController();
    var lastNameController = TextEditingController();
    var phoneNumberController = TextEditingController();
    var passwordController = TextEditingController();
    var confirmPasswordController = TextEditingController();
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
                    'REGISTER',
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
                    controller: firstNameController,
                    type: TextInputType.name,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter your first name';
                      }
                    },
                    label: 'First name',
                    prefix: Icons.person_rounded,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defultFormField(
                    controller: lastNameController,
                    type: TextInputType.name,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'please enter your last name';
                      }
                    },
                    label: 'Last name',
                    prefix: Icons.person_rounded,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defultFormField(
                    controller: emailController,
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
                  IntlPhoneField(
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    showDropdownIcon: false,
                    initialCountryCode: 'EG',
                    controller: phoneNumberController,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defultFormField(
                    onSubmit: (value) {
                      if (formKey.currentState!.validate()) {

                      }
                    },
                    controller: passwordController,
                    // isPassword: ShopLoginCubit.get(context).isPassword,
                    type: TextInputType.visiblePassword,
                    // suffix: ShopLoginCubit.get(context).suffix,
                    // suffixPressed: () {
                    //   ShopLoginCubit.get(context)
                    //       .changePasswordVisibility();
                    // },
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
                  defultFormField(
                    controller: confirmPasswordController,
                    type: TextInputType.visiblePassword,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Password is to short';
                      }
                    },
                    // suffix: ShopLoginCubit.get(context).suffix,
                    label: 'Confirm Password',
                    prefix: Icons.check,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
              DefaultButton(
                title: 'Register',
                onPressed: () async{
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      register();
                    });
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
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: () async {

                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
