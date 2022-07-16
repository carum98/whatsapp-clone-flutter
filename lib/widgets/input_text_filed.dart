import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final Function(String) onChanged;

  const InputTextField({
    Key? key,
    required this.label,
    required this.onChanged,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        labelStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        isDense: true,
      ),
      obscureText: isPassword,
      onChanged: onChanged,
      cursorColor: Colors.grey,
    );
  }
}
