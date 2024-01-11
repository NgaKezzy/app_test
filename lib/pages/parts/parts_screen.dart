import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/cubit/part_state.dart';
import 'package:test_app/cubit/unit_cubit.dart';
import 'package:test_app/cubit/unit_state.dart';
import 'package:test_app/pages/parts/add_part.dart';
import 'package:test_app/pages/parts/item_part.dart';
import 'package:test_app/pages/units/itemm_unit.dart';
import 'package:test_app/widgets/header_app.dart';

class PartScreen extends StatelessWidget {
  const PartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPart(),
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
              title: 'Danh sách sản phẩm'),
        ),
        body: BlocBuilder<PartCubit, PartState>(
          builder: (context, state) {
            if (state.parts == null || state.parts!.isEmpty) {
              return const Center(
                child: Text('Chưa đơn vị nào !'),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: state.parts!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return ItemPart(
                  part: state.parts![index],
                );
              },
            );
          },
        ));
  }
}
