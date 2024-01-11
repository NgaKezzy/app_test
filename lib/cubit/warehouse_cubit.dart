import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/warehouse_state.dart';
import 'package:test_app/models/warehouse.dart';

class WarehouseCubit extends Cubit<WarehouseState> {
  WarehouseCubit() : super(const WarehouseState());

  final db = FirebaseDatabase.instance.ref().child('Warehouses');
  bool isAddWarehouse = false;

  Future<void> addWarehouse(Warehouse warehouses) async {
    isAddWarehouse = false;
    List<Warehouse>? newWarehouses = state.warehouses;

    if (newWarehouses != null) {
      for (var element in newWarehouses) {
        if (element.id == warehouses.id ||
            element.address == warehouses.address) {
          return;
        }
      }
      await db.child(warehouses.id).set({
        'id': warehouses.id,
        'name': warehouses.name,
        'address': warehouses.address,
      }).then((value) => {
            print('hehehehehehehehhehehehe'),
            getWarehouse(),
            isAddWarehouse = true,
          });
    }
  }

  Future<void> getWarehouse() async {
    emit(state.copyWith(status: WarehousesStatus.loading));
    List<Warehouse> newWarehouses = [];
    final snapshot = await db.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null || data.isEmpty) {
      emit(state.copyWith(
          warehouses: newWarehouses, status: WarehousesStatus.success));
      return;
    }

    Map<String, dynamic> newData = data as Map<String, dynamic>;

    newData.forEach(
      (key, value) {
        Warehouse warehouse;
        warehouse = Warehouse.fromJson(value);
        newWarehouses.add(warehouse);
        printCyan(warehouse.name);
      },
    );

    emit(state.copyWith(
        status: WarehousesStatus.loading, warehouses: newWarehouses));
  }

  Future<void> removeWarehouse(Warehouse warehouses) async {
    await db.child(warehouses.id).remove();
    getWarehouse();
  }

  Future<void> updateWarehouse(Warehouse warehouses) async {
    await db.child(warehouses.id).update({
      'name': warehouses.name,
      'address': warehouses.address,
    });
    getWarehouse();
  }
}
