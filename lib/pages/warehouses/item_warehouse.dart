import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/cubit/warehouse_cubit.dart';
import 'package:test_app/models/warehouse.dart';
import 'package:test_app/pages/warehouses/update_warehouse.dart';
import 'package:test_app/widgets/custom_icon_edit_and_remove.dart';

class ItemWarehouse extends StatelessWidget {
  const ItemWarehouse({super.key, required this.warehouse});
  final Warehouse warehouse;
  @override
  Widget build(BuildContext context) {
    final WarehouseCubit warehouseCubit = context.read<WarehouseCubit>();

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3 - 16,
                        child: Text('ID: ${warehouse.id}')),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text('Tên kho: ${warehouse.name}')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text('Địa chỉ: ${warehouse.address}')),
                    const Expanded(child: SizedBox()),
                    CustomIconEditAndRemove(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateWarehouse(
                                      warehouses: warehouse,
                                    )));
                      },
                      icon: Icons.edit,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomIconEditAndRemove(
                      callback: () async {
                        await warehouseCubit.removeWarehouse(warehouse);
                        Fluttertoast.showToast(
                            msg: "Xóa thành công !",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      icon: Icons.delete,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
