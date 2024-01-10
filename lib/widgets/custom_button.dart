import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, this.title = 'Button', required this.callback});
  final String title;
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.85,
      child: ElevatedButton(
          onPressed: () {
            callback.call();
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
