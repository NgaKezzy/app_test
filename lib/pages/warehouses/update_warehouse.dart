import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/cubit/warehouse_cubit.dart';
import 'package:test_app/models/warehouse.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class UpdateWarehouse extends StatefulWidget {
  const UpdateWarehouse({super.key, required this.warehouses});
  final Warehouses warehouses;

  @override
  State<UpdateWarehouse> createState() => _UpdateWarehouseState();
}

class _UpdateWarehouseState extends State<UpdateWarehouse> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final formKeyUpdateWarehouse = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = widget.warehouses.name;
    addressController.text = widget.warehouses.address;

    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final WarehouseCubit warehouseCubit = context.read<WarehouseCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: HeaderApp(
          callback: () {
            Navigator.pop(context);
          },
          title: 'Chỉnh sửa kho',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyUpdateWarehouse,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ID : ${widget.warehouses.id}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: nameController,
                  labelText: 'Thành phố',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: addressController,
                  labelText: 'ĐỊa chỉ',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: 'Sửa kho',
                  callback: () async {
                    if (formKeyUpdateWarehouse.currentState!.validate()) {
                      await warehouseCubit.updateWarehouse(widget.warehouses);
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
