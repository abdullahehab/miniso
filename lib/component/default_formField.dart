import 'package:flutter/material.dart';

Widget defultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  void Function(String)? onChanged,
  void Function()? onTap,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  bool isClickable = true,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      validator: validate,
      obscureText: isPassword,
      enabled: isClickable,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(Icons.remove_red_eye),
        )
            : null,
      ),
    );
