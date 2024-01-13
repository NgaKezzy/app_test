import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/cubit/product_state.dart';
import 'package:test_app/pages/receipt/add_receipt.dart';
import 'package:test_app/pages/receipt/item_selected_product.dart';
import 'package:test_app/pages/receipt/receipt_screen.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/header_app.dart';

class SelectedProduct extends StatefulWidget {
  const SelectedProduct({super.key});

  @override
  State<SelectedProduct> createState() => _SelectedProductState();
}

class _SelectedProductState extends State<SelectedProduct> {
  List<bool> selectedItems = [];
  late ProductCubit productCubit;
  bool isProduct = false;

  @override
  void initState() {
    productCubit = context.read<ProductCubit>();
    productCubit.state.products?.forEach((element) {
      selectedItems.add(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductCubit productCubit = context.read<ProductCubit>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        title: HeaderApp(
          callback: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const ReceiptScreen()));
          },
          title: 'Chọn hàng cho phiếu thu',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              if (state.products == null || state.products!.isEmpty) {
                return const Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Chưa có sản phẩm nào !'),
                        Text('Hãy đi tạo sản phẩm trước !'),
                      ]),
                );
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ItemSelectProduct(
                            callback: () {
                              setState(() {
                                selectedItems[index] = !selectedItems[index];
                              });
                            },
                            product: state.products![index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: productCubit.state.products!.length),
                  ),
                  isProduct
                      ? CustomButton(
                          title: 'Tiếp',
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddReceipt(
                                          items: selectedItems,
                                        )));
                          },
                        )
                      : SizedBox(),
                  const SizedBox(
                    height: 30,
                  )
                ],
              );
            },
          )),
    );
  }
}
