import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/models/part.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/models/stocker.dart';
import 'package:test_app/models/unit.dart';
import 'package:test_app/models/warehouse.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    required this.values,
    this.placeholder,
    this.onOptionChanged,
  });
  final List? values;
  final String? placeholder;
  final ValueChanged<String>? onOptionChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final dropDownController = DropdownController();
  final List<CoolDropdownItem<String>> items = [];
  String _selectedOption = '';

  void checkDataType() {
    if (widget.values.runtimeType == List<Unit>) {
      widget.values?.forEach((element) {
        items.add(
            CoolDropdownItem(label: element.symbol, value: element.symbol));
      });
    } else if (widget.values.runtimeType == List<Part>) {
      widget.values?.forEach((element) {
        items.add(CoolDropdownItem(label: element.name, value: element.id));
      });
    } else if (widget.values.runtimeType == List<Warehouse>) {
      widget.values?.forEach((element) {
        items.add(CoolDropdownItem(label: element.name, value: element.id));
      });
    }
     else if (widget.values.runtimeType == List<Stocker>) {
      widget.values?.forEach((element) {
        items.add(CoolDropdownItem(label: element.name, value: element.id));
      });
    }
    else if (widget.values.runtimeType == List<Product>) {
      widget.values?.forEach((element) {
        items.add(CoolDropdownItem(
            label: element.name, value: element.id.toString()));
      });
    } else {
      printRed('không xác định được kiểu dữ liệu');
    }
  }

  @override
  void initState() {
    checkDataType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CoolDropdown<String>(
      controller: dropDownController,
      dropdownList: items,
      defaultItem: null,
      onChange: (value) async {
        setState(() {
          _selectedOption = value;
        });
        widget.onOptionChanged?.call(value);

        dropDownController.close();
      },
      onOpen: (value) {
        printRed('text');
      },
      resultOptions: ResultOptions(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 150,
        icon: const SizedBox(
          width: 10,
          height: 10,
          child: CustomPaint(
            painter: DropdownArrowPainter(),
          ),
        ),
        render: ResultRender.all,
        placeholder: widget.placeholder ?? 'Selected',
        isMarquee: true,
      ),
      dropdownOptions: const DropdownOptions(
          top: 20,
          height: 300,
          gap: DropdownGap.all(5),
          borderSide: BorderSide(width: 1, color: Colors.black),
          padding: EdgeInsets.symmetric(horizontal: 10),
          align: DropdownAlign.left,
          animationType: DropdownAnimationType.size),
      dropdownTriangleOptions: DropdownTriangleOptions(
        width: 20,
        height: 30,
        align: DropdownTriangleAlign.left,
        borderRadius: 3,
        left: 20,
      ),
      dropdownItemOptions: DropdownItemOptions(
        isMarquee: true,
        mainAxisAlignment: MainAxisAlignment.start,
        render: DropdownItemRender.all,
        height: 40,
      ),
    );
  }
}
