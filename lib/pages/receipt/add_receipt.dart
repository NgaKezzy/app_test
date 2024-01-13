import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/cubit/warehouse_cubit.dart';
import 'package:test_app/models/goods_text_editing_controlle.dart';
import 'package:test_app/models/goods_votes.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/pages/receipt/warehoused_goods.dart';
import 'package:test_app/widgets/custom_drop_down.dart';
import 'package:test_app/widgets/custom_text_field.dart';
import 'package:test_app/widgets/header_app.dart';

class AddReceipt extends StatefulWidget {
  const AddReceipt({super.key, required this.items});
  final List<bool> items;

  @override
  State<AddReceipt> createState() => _AddReceiptState();
}

class _AddReceiptState extends State<AddReceipt> {
  final unitController = DropdownController();
  final partController = DropdownController();
  final warehouseController = DropdownController();

  final List<GoodsTextEditingController> _textEditingControllers = [];

  final dateFoundedController = TextEditingController();
  final votesController = TextEditingController();
  final inDebtController = TextEditingController();
  final haveController = TextEditingController();
  final accordingToController = TextEditingController();
  final numberController = TextEditingController();
  final deliverController = TextEditingController();
  final belongToController = TextEditingController();

  String warehouseAddress = '';
  String idUnit = '';
  String idPart = '';
  String idWarehouse = '';
  int lengthProduct = 0;
  late ProductCubit productCubit;
  final List<Product> newProducts = [];
  double totalPrice = 0;
  final List<GoodsVotes> newGoods = [];

  final unitDownController = DropdownController();
  final partDownController = DropdownController();
  final warehouseDownController = DropdownController();

  void genController() {
    setState(() {
      for (int i = 0; i < newProducts.length; i++) {
        final price = TextEditingController();
        final quantity = TextEditingController();
        final real = TextEditingController();

        _textEditingControllers.add(GoodsTextEditingController(
            priceController: price,
            quantityController: quantity,
            realController: real));
      }
    });
  }

  void getValueTotalPrice() {
    double sum = 0;
    for (var element in _textEditingControllers) {
      // ignore: unrelated_type_equality_checks
      if (element.priceController.text != '' &&
          element.quantityController.text != '') {
        sum += (double.parse(element.priceController.text) *
            double.parse(element.quantityController.text));
      }
    }
    setState(() {
      totalPrice = sum;
      printRed(totalPrice.toString());
    });
  }

  @override
  void initState() {
    productCubit = context.read<ProductCubit>();
    for (int i = 0; i < productCubit.state.products!.length; i++) {
      if (widget.items[i] == true) {
        newProducts.add(productCubit.state.products![i]);
      }
    }
    genController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UnitCubit unitCubit = context.read<UnitCubit>();
    final PartCubit partCubit = context.read<PartCubit>();
    final WarehouseCubit warehouseCubit = context.read<WarehouseCubit>();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        title: HeaderApp(
          callback: () {
            Navigator.pop(context);
          },
          title: 'Thêm phiếu thu',
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomDropDown(
                  onOptionChanged: (value) {
                    setState(() {
                      idUnit = value;
                    });
                  },
                  placeholder: 'Đơn vị',
                  values: unitCubit.state.units,
                ),
                CustomDropDown(
                  onOptionChanged: (value) {
                    idPart = value;
                  },
                  placeholder: 'Bộ phận',
                  values: partCubit.state.parts,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: CustomTextField(
                        controller: dateFoundedController,
                        labelText: 'Ngày lập',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: CustomTextField(
                        controller: votesController,
                        labelText: 'Số phiếu',
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: CustomTextField(
                        controller: inDebtController,
                        labelText: 'Nợ',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: CustomTextField(
                        controller: haveController,
                        labelText: 'Có',
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: 150,
                  child: CustomTextField(
                    controller: accordingToController,
                    labelText: 'Theo',
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: CustomTextField(
                    controller: numberController,
                    labelText: 'Số',
                    type: TextInputType.number,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: belongToController,
              labelText: 'Của',
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: deliverController,
              labelText: 'Người giao',
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Ngày giao'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomDropDown(
                  onOptionChanged: (value) {
                    setState(() {
                      idWarehouse = value;
                    });
                    warehouseCubit.state.warehouses?.forEach((element) {
                      if (element.id == value) {
                        setState(() {
                          warehouseAddress = element.address.toUpperCase();
                        });
                      }
                    });
                  },
                  placeholder: 'Kho hàng',
                  values: warehouseCubit.state.warehouses,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Địa chỉ'),
                      Text(
                        warehouseAddress,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Hàng hóa',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(
                newProducts.length,
                (index) => WarehousedGoods(
                    callback: () {},
                    onChanged: (value) {
                      getValueTotalPrice();
                    },
                    priceController:
                        _textEditingControllers[index].priceController,
                    quantityController:
                        _textEditingControllers[index].quantityController,
                    realController:
                        _textEditingControllers[index].realController,
                    product: newProducts[index])),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng tiền :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  '$totalPrice',
                  style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                        onPressed: () {
                          for (int i = 0; i < newProducts.length; i++) {
                            setState(() {
                              newGoods.add(GoodsVotes(
                                  idProduct: newProducts[i].id.toString(),
                                  idReceipt: votesController.text,
                                  unitPrice: double.parse(newProducts[i].unit),
                                  quantityAccordingToDocuments: int.parse(
                                      _textEditingControllers[i]
                                          .quantityController
                                          .text),
                                  actualQuantityImported: int.parse(
                                      _textEditingControllers[i]
                                          .realController
                                          .text)));
                            });
                          }
                          ;
                        },
                        child: Text('Thêm'))),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      )),
    );
  }
}
