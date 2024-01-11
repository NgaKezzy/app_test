import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/models/part.dart';
import 'package:test_app/pages/parts/update_part.dart';
import 'package:test_app/pages/units/update_unit.dart';
import 'package:test_app/widgets/custom_icon_edit_and_remove.dart';

class ItemPart extends StatelessWidget {
  const ItemPart({super.key, required this.part});

  final Part part;

  @override
  Widget build(BuildContext context) {
    final PartCubit partCubit = context.read<PartCubit>();
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
                            child: Text('Ký hiệu: ${part.id}')),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text('Thành phố: ${part.name}')),
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
                                    builder: (context) => UpdatePart(
                                          part: part,
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
                            await partCubit.removePart(part);
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
