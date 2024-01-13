import 'package:flutter/material.dart';

class ItemHomeApp extends StatelessWidget {
  const ItemHomeApp(
      {super.key, this.title = '', this.color = Colors.grey, this.callback});
  final String title;
  final Color color;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        callback?.call();
      },
      child: Container(
        height: 120,
        width: width * 0.47 - 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: color.withOpacity(0.3)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
