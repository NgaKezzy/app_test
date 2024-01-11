import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/stocker_state.dart';
import 'package:test_app/models/stocker.dart';

class StockerCubit extends Cubit<StockerState> {
  StockerCubit() : super(const StockerState());

  final db = FirebaseDatabase.instance.ref().child('Stockers');
  bool isAddStocker = false;

  Future<void> addStocker(Stocker stocker) async {
    isAddStocker = false;
    emit(state.copyWith(status: StockerStatus.loading));
    List<Stocker>? newStocker = state.stockers;
    if (newStocker != null || newStocker!.isEmpty) {
      for (var element in newStocker) {
        if (element.id == stocker.id) {
          return;
        }
      }
      await db.child(stocker.id).set({
        'id': stocker.id,
        'name': stocker.name,
        'phone': stocker.phone,
        'address': stocker.address,
      }).then((value) => {getStocker(), isAddStocker = true});
      emit(state.copyWith(status: StockerStatus.success));
    }
  }

  Future<void> getStocker() async {
    emit(state.copyWith(status: StockerStatus.loading));
    List<Stocker> newStocker = [];
    final snapshot = await db.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null || data.isEmpty) {
      emit(state.copyWith(stockers: newStocker, status: StockerStatus.success));
      return;
    }
    Map<String, dynamic> newData = data as Map<String, dynamic>;

    newData.forEach(
      (key, value) {
        Stocker stocker;
        stocker = Stocker.fromJson(value);
        newStocker.add(stocker);
        printRed(stocker.name);
      },
    );

    emit(state.copyWith(status: StockerStatus.loading, stockers: newStocker));
  }

  Future<void> removeStocker(Stocker stocker) async {
    await db.child(stocker.id).remove().then((value) => {
          getStocker(),
        });
  }

  Future<void> updateStocker(Stocker stocker) async {
    await db.child(stocker.id).update({
      'name': stocker.name,
      'phone': stocker.phone,
      'address': stocker.address,
    });
    getStocker();
  }
}
