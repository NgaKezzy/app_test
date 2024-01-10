import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/models/unit.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class AddUnit extends StatefulWidget {
  AddUnit({super.key});

  @override
  State<AddUnit> createState() => _AddUnitState();
}

class _AddUnitState extends State<AddUnit> {
  final TextEditingController symbolController = TextEditingController();

  final TextEditingController cityController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    symbolController.dispose();
    cityController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UnitCubit unitCubit = context.read<UnitCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: HeaderApp(
          callback: () {
            Navigator.pop(context);
          },
          title: 'Thêm đơn vị',
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
                  controller: symbolController,
                  labelText: 'Ký hiệu',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: cityController,
                  labelText: 'Thành phố',
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
                  title: 'Thêm đơn vị',
                  callback: () {
                    if (formKey.currentState!.validate()) {
                      unitCubit
                          .addUnit(
                            Unit(
                              symbol:
                                  symbolController.text.toUpperCase().trim(),
                              city: cityController.text.toUpperCase().trim(),
                              address: addressController.text.trim(),
                            ),
                          )
                          .then((value) => {FocusScope.of(context).unfocus()});
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
