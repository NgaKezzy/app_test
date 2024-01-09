import 'package:flutter/material.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp(
      {super.key,
      this.title = '',
      this.child = const SizedBox(),
      this.callback});
  final String title;
  final Widget child;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              callback?.call();
            },
            child: const Icon(Icons.arrow_back)),
        Text(title),
        child
      ],
    );
  }
}
