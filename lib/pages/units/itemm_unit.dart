import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/models/unit.dart';
import 'package:test_app/pages/units/update_unit.dart';
import 'package:test_app/widgets/custom_icon_edit_and_remove.dart';

class ItemUnit extends StatelessWidget {
  const ItemUnit({super.key, required this.unit});

  final Unit unit;

  @override
  Widget build(BuildContext context) {
    final UnitCubit unitCubit = context.read<UnitCubit>();
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
                    Text('Ký hiệu: ${unit.symbol}'),
                    Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text('Thành phố: ${unit.city}')),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text('Địa chỉ: ${unit.address}')),
                    const Expanded(child: SizedBox()),
                    CustomIconEditAndRemove(
                      callback: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateUnit(unit: unit)));
                      },
                      icon: Icons.edit,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    CustomIconEditAndRemove(
                      callback: () {
                        unitCubit.removeUnit(unit.symbol);
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
