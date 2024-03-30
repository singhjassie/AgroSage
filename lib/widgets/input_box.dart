import 'package:flutter/material.dart';

class InputBox extends StatefulWidget {
  const InputBox({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.isPassword,
    required this.validator,
    required this.controller,
  });
  final IconData prefixIcon;
  final String hintText;
  final bool isPassword;
  final String? Function(String?) validator;
  final TextEditingController controller;

  @override
  State<InputBox> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: !_isPasswordVisible && widget.isPassword,
      obscuringCharacter: '*',
      controller: widget.controller,
      decoration: InputDecoration(
          filled: true,
          fillColor: colorScheme.secondaryContainer,
          label: Text(widget.hintText),
          hintText: widget.hintText,
          prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          hintStyle: TextStyle(
            color: colorScheme.onSecondaryContainer.withOpacity(.7),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(12),
          )),
    );
  }
}
