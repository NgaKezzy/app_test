import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/part_cubit.dart';
import 'package:test_app/cubit/part_state.dart';
import 'package:test_app/cubit/stocker_cubit.dart';
import 'package:test_app/cubit/stocker_state.dart';
import 'package:test_app/pages/Stocker/add_stocker.dart';
import 'package:test_app/pages/Stocker/item_stocker.dart';
import 'package:test_app/pages/parts/item_part.dart';
import 'package:test_app/widgets/header_app.dart';

class StockerScreen extends StatelessWidget {
  const StockerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddStocker(),
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
              title: 'Danh sách thủ kho'),
        ),
        body: BlocBuilder<StockerCubit, StockerState>(
          builder: (context, state) {
            if (state.stockers == null || state.stockers!.isEmpty) {
              return const Center(
                child: Text('Chưa có thủ kho nào !'),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              itemCount: state.stockers!.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              itemBuilder: (context, index) {
                return ItemStocker(
                  stocker: state.stockers![index],
                );
              },
            );
          },
        ));
  }
}
