import 'package:flutter/material.dart';
import 'package:test_app/pages/home_app.dart';
import 'package:test_app/pages/receipt/slected_product.dart';
import 'package:test_app/widgets/header_app.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectedProduct(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: HeaderApp(
            callback: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const HomeApp()));
            },
            title: 'Danh sách phiếu thu'),
      ),
      body: Center(),
    );
  }
}
