import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/pages/receipt/add_receipt.dart';
import 'package:test_app/pages/receipt/item_selected_product.dart';
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
            Navigator.pop(context);
          },
          title: 'Chọn hàng cho phiếu thu',
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
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
                        product: productCubit.state.products![index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: productCubit.state.products!.length),
              ),
              CustomButton(
                title: 'Tiếp',
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddReceipt(
                                items: selectedItems,
                              )));
                },
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
    );
  }
}
