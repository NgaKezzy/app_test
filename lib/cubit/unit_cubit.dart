import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/unit_state.dart';
import 'package:test_app/models/unit.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit() : super(const UnitState());

  final db = FirebaseDatabase.instance.ref().child('Units');

  Future<void> addUnit(Unit unit) async {
    emit(state.copyWith(status: UnitStatus.loading));

    List<Unit>? newUnits = state.units;

    if (newUnits != null || newUnits!.isEmpty) {
      for (var element in newUnits) {
        if (element.symbol == unit.symbol || element.address == unit.address) {
          Fluttertoast.showToast(
              msg: "Trùng  với đơn vị đã có !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          return;
        }
      }

      db.child(unit.symbol).set({
        'symbol': unit.symbol,
        'city': unit.city,
        'address': unit.address,
      }).then((value) => {
            getUnit(),
            Fluttertoast.showToast(
                msg: "Thêm thành công !",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0),
          });
    }

    emit(state.copyWith(status: UnitStatus.success));
  }

  Future<void> getUnit() async {
    emit(state.copyWith(status: UnitStatus.loading));
    List<Unit> newUnits = [];
    final snapshot = await db.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null || data.isEmpty) {
      printYellow('rỗng');

      emit(state.copyWith(units: newUnits, status: UnitStatus.success));
      return;
    }
    Map<String, dynamic> newData = data as Map<String, dynamic>;

    newData.forEach(
      (key, value) {
        Unit unit;
        unit = Unit.fromJson(value);
        newUnits.add(unit);
        printRed(unit.city);
      },
    );

    emit(state.copyWith(status: UnitStatus.loading, units: newUnits));
  }

  Future<void> removeUnit(String symbol) async {
    await db.child(symbol).remove().then((value) => {
          getUnit(),
          Fluttertoast.showToast(
              msg: "Xóa thành công !",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0),
        });
  }

  Future<void> updateUnit(Unit unit) async {
    await db.child(unit.symbol).update({
      'city': unit.city,
      'address': unit.address,
    });
    getUnit();
    Fluttertoast.showToast(
        msg: "Sửa thành công !",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
