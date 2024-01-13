import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/receipt_cubit.dart';
import 'package:test_app/cubit/receipt_state.dart';
import 'package:test_app/pages/home_app.dart';
import 'package:test_app/pages/receipt/item_receipt.dart';
import 'package:test_app/pages/receipt/slected_product.dart';
import 'package:test_app/widgets/header_app.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({super.key});

  @override
  State<ReceiptScreen> createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
  late ReceiptCubit receiptCubit;
  @override
  void initState() {
    receiptCubit = context.read<ReceiptCubit>();
    receiptCubit.getReceipt();
    receiptCubit.getItemOfReceipts();
    super.initState();
  }

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<ReceiptCubit, ReceiptState>(
            builder: (context, state) {
              if (state.receipts!.isEmpty || state.receipts == null) {
                return const Center(child: Text('Không có phiếu thu nào!'));
              }
              return Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: state.receipts?.length,
                  itemBuilder: (context, index) {
                    return ItemReceipt(
                      receipt: state.receipts![index],
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
