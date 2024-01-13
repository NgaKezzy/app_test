import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/models/part.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class AddPart extends StatefulWidget {
  const AddPart({super.key});

  @override
  State<AddPart> createState() => _AddPartState();
}

class _AddPartState extends State<AddPart> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final formKeyAddPart = GlobalKey<FormState>();

  @override
  void dispose() {
    idController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final PartCubit partCubit = context.read<PartCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: HeaderApp(
          callback: () {
            Navigator.pop(context);
          },
          title: 'Thêm bộ phận',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyAddPart,
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
                  labelText: 'Tên bộ phận',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: 'Thêm',
                  callback: () async {
                    if (formKeyAddPart.currentState!.validate()) {
                      await partCubit.addPart(Part(
                        id: idController.text.toUpperCase().trim(),
                        name: nameController.text.trim(),
                      ));
                      if (partCubit.isAddPart) {
                        Fluttertoast.showToast(
                            msg: "Thêm thành công !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        idController.clear();
                        nameController.clear();
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
