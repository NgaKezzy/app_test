import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class UpdateProduct extends StatefulWidget {
  const UpdateProduct({super.key, required this.product});

  final Product product;

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final formKeyUpdateProduct = GlobalKey<FormState>();

  @override
  void initState() {
    idController.text = widget.product.id.toString();
    nameController.text = widget.product.name;
    unitController.text = widget.product.unit;
    super.initState();
  }

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
          title: 'Chỉnh sửa sản phẩm',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyUpdateProduct,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ID : ${widget.product.id}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                  title: 'Sửa sản phẩm',
                  callback: () {
                    if (formKeyUpdateProduct.currentState!.validate()) {
                      productCubit.updateProduct(Product(
                          id: int.parse(idController.text.trim()),
                          name: nameController.text.trim(),
                          unit: unitController.text.trim()));
                      Fluttertoast.showToast(
                          msg: "Sửa thành công !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
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
