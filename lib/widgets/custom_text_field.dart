import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.labelText = '',
      this.color = Colors.green,
      this.callback,
      this.type = TextInputType.text});
  final TextEditingController? controller;
  final String labelText;
  final TextInputType type;
  final ValueChanged? callback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        callback?.call(value);
      },
      textInputAction: TextInputAction.next,
      keyboardType: type,
      validator: _checkValidator,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: color),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.5, color: color),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

String? _checkValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Vui lòng nhập nội dung !';
  }
  return null;
}
