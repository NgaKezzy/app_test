import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/cubit/stocker_cubit.dart';
import 'package:test_app/models/stocker.dart';
import 'package:test_app/pages/Stocker/update_stocker.dart';
import 'package:test_app/widgets/custom_icon_edit_and_remove.dart';

class ItemStocker extends StatelessWidget {
  const ItemStocker({super.key, required this.stocker});

  final Stocker stocker;

  @override
  Widget build(BuildContext context) {
    final StockerCubit stockerCubit = context.read<StockerCubit>();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text('ID: ${stocker.id}')),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text('Tên: ${stocker.name}')),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text('Sđt: ${stocker.phone}')),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text('Địa chỉ: ${stocker.address}')),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        CustomIconEditAndRemove(
                          callback: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateStocker(
                                          stocker: stocker,
                                        )));
                          },
                          icon: Icons.edit,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomIconEditAndRemove(
                          callback: () async {
                            await stockerCubit.removeStocker(stocker);
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
                    )
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
