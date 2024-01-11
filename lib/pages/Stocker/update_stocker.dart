import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/models/part.dart';
import 'package:test_app/models/unit.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class UpdatePart extends StatefulWidget {
  const UpdatePart({super.key, required this.part});
  final Part part;

  @override
  State<UpdatePart> createState() => _UpdatePartState();
}

class _UpdatePartState extends State<UpdatePart> {
  final TextEditingController nameController = TextEditingController();

  final formKeyUpdatePart = GlobalKey<FormState>();

  @override
  void initState() {
    nameController.text = widget.part.name;

    super.initState();
  }

  @override
  void dispose() {
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
          title: 'Chỉnh sửa đơn vị',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyUpdatePart,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ID : ${widget.part.id}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
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
                  title: 'Sửa đơn vị',
                  callback: () async {
                    if (formKeyUpdatePart.currentState!.validate()) {
                      await partCubit.updatePart(Part(
                          id: widget.part.id,
                          name: nameController.text.trim()));
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
