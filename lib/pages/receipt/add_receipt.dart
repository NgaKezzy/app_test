import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/cubit/product_cubit.dart';
import 'package:test_app/cubit/receipt_cubit.dart';
import 'package:test_app/cubit/stocker_cubit.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/cubit/warehouse_cubit.dart';
import 'package:test_app/models/goods_text_editing_controlle.dart';
import 'package:test_app/models/goods_votes.dart';
import 'package:test_app/models/product.dart';
import 'package:test_app/models/receipt.dart';
import 'package:test_app/models/stocker.dart';
import 'package:test_app/pages/receipt/slected_product.dart';
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
  String idStocker = '';

  String immediately = DateFormat(
    'yyyy-MM-dd',
  ).format(DateTime.now());

  String deliveryDate = DateFormat(
    'yyyy-MM-dd',
  ).format(DateTime.now());

  int lengthProduct = 0;
  late ProductCubit productCubit;
  final List<Product> newProducts = [];
  double totalPrice = 0;
  final List<GoodsVotes> newGoods = [];
  final keyReceipt = GlobalKey<FormState>();

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

  Future<void> setValueInGoodsVotes() async {
    for (int i = 0; i < newProducts.length; i++) {
      setState(() {
        newGoods.add(GoodsVotes(
            idProduct: newProducts[i].id.toString(),
            idReceipt: votesController.text,
            unitPrice: _textEditingControllers[i].priceController.text,
            quantityAccordingToDocuments:
                _textEditingControllers[i].quantityController.text,
            actualQuantityImported:
                _textEditingControllers[i].realController.text));
      });
    }
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
    final ReceiptCubit receiptCubit = context.read<ReceiptCubit>();
    final StockerCubit stockerCubit = context.read<StockerCubit>();

    final WarehouseCubit warehouseCubit = context.read<WarehouseCubit>();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          automaticallyImplyLeading: false,
          title: HeaderApp(
            callback: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SelectedProduct()));
            },
            title: 'Thêm phiếu thu',
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: keyReceipt,
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
                    InkWell(
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030),
                        ).then((value) => {
                              if (value != null)
                                {
                                  printRed(value.toString()),
                                  setState(() {
                                    immediately =
                                        value.toString().split(' ')[0];
                                  })
                                },
                            });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(8),
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Ngày lập  '),
                                Icon(Icons.calendar_month),
                              ],
                            ),
                            Text(
                              ' $immediately',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomTextField(
                        type: TextInputType.number,
                        controller: votesController,
                        labelText: 'Số phiếu',
                      ),
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
                      width: 150,
                      child: CustomTextField(
                        controller: haveController,
                        labelText: 'Có',
                      ),
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
                      width: 150,
                      child: CustomTextField(
                        controller: accordingToController,
                        labelText: 'Theo',
                      ),
                    ),
                    SizedBox(
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
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.grey.shade200,
                  child: InkWell(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      ).then((value) => {
                            if (value != null)
                              {
                                printRed(value.toString()),
                                setState(() {
                                  deliveryDate = value.toString().split(' ')[0];
                                })
                              },
                          });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_month),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text('Ngày giao hàng'),
                            Text(
                              ' $deliveryDate',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
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
                    CustomDropDown(
                      onOptionChanged: (value) {
                        setState(() {
                          idStocker = value;
                        });
                      },
                      placeholder: 'Thủ kho',
                      values: stockerCubit.state.stockers,
                    ),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      ' ${NumberFormat.decimalPattern().format(totalPrice)}',
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: ElevatedButton(
                            onPressed: () async {
                              if (keyReceipt.currentState!.validate() &&
                                  idUnit != '' &&
                                  idPart != '' &&
                                  idWarehouse != '' &&
                                  idStocker != '') {
                                printYellow('Đầy đủ thông tin');
                                await setValueInGoodsVotes();
                                receiptCubit.addItemOfReceipts(newGoods);

                                receiptCubit.addReceipt(Receipt(
                                    id: int.parse(votesController.text),
                                    idUnit: idUnit,
                                    idPart: idPart,
                                    idWarehouse: idWarehouse,
                                    idStoker: idStocker,
                                    inputDay: immediately,
                                    deliver: deliverController.text,
                                    deliveryDate: deliveryDate,
                                    number: int.parse(numberController.text),
                                    accordingTo: belongToController.text,
                                    originalDocumentNumber: '',
                                    inDebt: int.parse(inDebtController.text),
                                    have: int.parse(haveController.text),
                                    totalPrice: totalPrice.toString()));
                              } else {
                                printYellow('Nhập thông tin');
                              }
                            },
                            child: Text('Thêm'))),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
