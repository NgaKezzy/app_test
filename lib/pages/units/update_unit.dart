import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/models/unit.dart';
import 'package:test_app/widgets/custom_button.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class UpdateUnit extends StatefulWidget {
  const UpdateUnit({super.key, required this.unit});
  final Unit unit;

  @override
  State<UpdateUnit> createState() => _UpdateUnitState();
}

class _UpdateUnitState extends State<UpdateUnit> {
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final formKeyUpdateUnit = GlobalKey<FormState>();

  @override
  void initState() {
    cityController.text = widget.unit.city;
    addressController.text = widget.unit.address;

    super.initState();
  }

  @override
  void dispose() {
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
          title: 'Chỉnh sửa đơn vị',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKeyUpdateUnit,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'ID : ${widget.unit.symbol}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
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
                  labelText: 'ĐỊa chỉ',
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                  title: 'Sửa đơn vị',
                  callback: () {
                    if (formKeyUpdateUnit.currentState!.validate()) {
                      unitCubit.updateUnit(Unit(
                          symbol: widget.unit.symbol,
                          city: cityController.text.toUpperCase().trim(),
                          address: addressController.text.trim()));
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
