import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/cubit/unit_state.dart';
import 'package:test_app/pages/units/itemm_unit.dart';
import 'package:test_app/pages/warehouses/add_warehouse.dart';
import 'package:test_app/widgets/header_app.dart';

class WarehouseScreen extends StatelessWidget {
  const WarehouseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddWarehouse(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1,
          title: HeaderApp(
              callback: () {
                Navigator.pop(context);
              },
              title: 'Danh sách kho hàng'),
        ),
        body: BlocBuilder<UnitCubit, UnitState>(
          builder: (context, state) {
            if (state.units == null || state.units!.isEmpty) {
              return const Center(
                child: Text('Chưa đơn vị nào !'),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: state.units!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return ItemUnit(
                  unit: state.units![index],
                );
              },
            );
          },
        ));
  }
}
