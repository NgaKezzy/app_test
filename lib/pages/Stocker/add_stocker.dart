import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/cubit/stocker_cubit.dart';
import 'package:test_app/models/part.dart';
import 'package:test_app/models/stocker.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class AddStocker extends StatefulWidget {
  const AddStocker({super.key});

  @override
  State<AddStocker> createState() => _AddStockerState();
}

class _AddStockerState extends State<AddStocker> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final formKeyAddStocker = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final StockerCubit stockerCubit = context.read<StockerCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: HeaderApp(
          callback: () {
            Navigator.pop(context);
          },
          title: 'Thêm thủ kho',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyAddStocker,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: idController,
                  labelText: 'ID',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: nameController,
                  labelText: 'Tên thủ kho',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  type: TextInputType.phone,
                  controller: phoneController,
                  labelText: 'Số điện thoại',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: addressController,
                  labelText: 'Địa chỉ',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: 'Thêm',
                  callback: () async {
                    if (formKeyAddStocker.currentState!.validate()) {
                      await stockerCubit.addStocker(Stocker(
                          id: idController.text.trim(),
                          name: nameController.text.trim(),
                          address: addressController.text.trim(),
                          phone: int.parse(phoneController.text.trim())));
                      if (stockerCubit.isAddStocker) {
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
                            msg: "Đã tồn tại !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
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
