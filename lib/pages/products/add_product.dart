import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    unitController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductCubit productCubit = context.read<ProductCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: HeaderApp(
          callback: () {
            Navigator.pop(context);
          },
          title: 'Thêm sản phẩm',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  type: TextInputType.number,
                  controller: idController,
                  labelText: 'Id sản phẩm',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: nameController,
                  labelText: 'Tên sản phẩm',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: unitController,
                  labelText: 'Đơn vị tính',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: 'Thêm sản phẩm',
                  callback: () async {
                    if (formKey.currentState!.validate()) {
                      await productCubit.addProduct(
                        Product(
                          id: int.parse(idController.text.trim()),
                          name: nameController.text.trim(),
                          unit: unitController.text.trim(),
                        ),
                      );
                      if (productCubit.isAddProduct) {
                        Fluttertoast.showToast(
                            msg: "Thêm thành công !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Trùng id với sản phẩm đã có !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                      idController.clear();
                      nameController.clear();
                      unitController.clear();
                      FocusScope.of(context).unfocus();
                    }
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
