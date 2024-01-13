import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_app/models/receipt.dart';
import 'package:test_app/pages/receipt/receipt_detail.dart';

class ItemReceipt extends StatelessWidget {
  const ItemReceipt({super.key, required this.receipt});
  final Receipt receipt;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ReceiptDetail(
                      receipt: receipt,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 1, color: Colors.grey, style: BorderStyle.solid)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ID: ${receipt.id}'),
                Text(receipt.inputDay),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Người giao'),
                    Text(receipt.deliver),
                  ],
                ),
                Column(
                  children: [
                    Text('Nợ: ${receipt.inDebt}'),
                    Text('Có: ${receipt.have}'),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tổng tiền: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                Text(
                  '${receipt.totalPrice}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
