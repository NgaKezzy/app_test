import 'package:flutter/material.dart';

class CustomIconEditAndRemove extends StatelessWidget {
  const CustomIconEditAndRemove(
      {super.key,
      required this.icon,
      this.color = Colors.black,
      this.callback});

  final IconData icon;
  final Color color;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback?.call();
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 30,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.grey),
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
