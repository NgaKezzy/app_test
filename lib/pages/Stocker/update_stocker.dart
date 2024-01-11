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

class UpdateStocker extends StatefulWidget {
  const UpdateStocker({super.key, required this.stocker});
  final Stocker stocker;

  @override
  State<UpdateStocker> createState() => _UpdateStockerState();
}

class _UpdateStockerState extends State<UpdateStocker> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final formKeyUpdateStocker = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = widget.stocker.name;
    phoneController.text = widget.stocker.phone.toString();
    addressController.text = widget.stocker.address;

    super.initState();
  }

  @override
  void dispose() {
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
          title: 'Chỉnh sửa thủ kho',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyUpdateStocker,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ID : ${widget.stocker.id}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
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
                  labelText: 'Sđt',
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
                  title: 'Sửa',
                  callback: () async {
                    if (formKeyUpdateStocker.currentState!.validate()) {
                      stockerCubit.updateStocker(Stocker(
                        id: widget.stocker.id,
                        name: nameController.text.trim(),
                        address: addressController.text.trim(),
                        phone: int.parse(phoneController.text.trim()),
                      ));
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
