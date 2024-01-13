import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/cubit/receipt_cubit.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/cubit/warehouse_cubit.dart';
import 'package:test_app/models/goods_votes.dart';
import 'package:test_app/models/receipt.dart';
import 'package:test_app/pages/receipt/item_detail_product.dart';
import 'package:test_app/widgets/header_app.dart';

class ReceiptDetail extends StatefulWidget {
  const ReceiptDetail({super.key, required this.receipt});
  final Receipt receipt;

  @override
  State<ReceiptDetail> createState() => _ReceiptDetailState();
}

class _ReceiptDetailState extends State<ReceiptDetail> {
  final List<GoodsVotes> resultGoodsVotes = [];
  late ReceiptCubit receiptCubit;
  late PartCubit partCubit;
  late WarehouseCubit warehouseCubit;

  String namePart = '';
  String nameWarehouse = '';
  String addressWarehouse = '';

  void setNamePart() {
    partCubit.state.parts?.forEach((element) {
      if (widget.receipt.idPart == element.id) {
        setState(() {
          namePart = element.name;
        });
      }
    });
  }

  void setValueWarehouse() {
    warehouseCubit.state.warehouses?.forEach((element) {
      if (widget.receipt.idWarehouse == element.id) {
        setState(() {
          nameWarehouse = element.name;
          addressWarehouse = element.address;
        });
      }
    });
  }

  @override
  void initState() {
    receiptCubit = context.read<ReceiptCubit>();
    partCubit = context.read<PartCubit>();
    warehouseCubit = context.read<WarehouseCubit>();

    setNamePart();
    setValueWarehouse();

    receiptCubit.state.goodsVotes?.forEach((element) {
      // ignore: unrelated_type_equality_checks
      if (element.idReceipt == widget.receipt.id.toString()) {
        setState(() {
          resultGoodsVotes.add(element);
          printRed(element.idProduct);
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: HeaderApp(
          callback: () {
            Navigator.pop(context);
          },
          title: 'Chi tiết phiếu thu',
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Đơn vị: ${widget.receipt.idUnit} '),
                Text('Nợ: ${widget.receipt.inDebt} '),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bộ phận: ${namePart}'),
                Text('Có: ${widget.receipt.have}'),
              ],
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    'PHIẾU NHẬP KHO',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Ngày: ${widget.receipt.inputDay}',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    'Số : ${widget.receipt.id}',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Họ tên người giao: ${widget.receipt.deliver}'),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Theo: ${widget.receipt.accordingTo}'),
                Text('Số: ${widget.receipt.number}'),
                Text('Ngày: ${widget.receipt.deliveryDate}'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text('Nhập tại kho: ${nameWarehouse}'),
            SizedBox(
              height: 5,
            ),
            Text('Địa điểm: ${addressWarehouse}'),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(
                resultGoodsVotes.length,
                (index) => ItemDetailProduct(
                      goodsVotes: resultGoodsVotes[index],
                    )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Tổng tiền  ',
                ),
                Text(
                  widget.receipt.totalPrice,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
