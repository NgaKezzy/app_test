import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:test_app/config/print_color.dart';
import 'package:test_app/cubit/part_state.dart';
import 'package:test_app/models/part.dart';

class PartCubit extends Cubit<PartState> {
  PartCubit() : super(const PartState());

  final db = FirebaseDatabase.instance.ref().child('Parts');
  bool isAddPart = false;

  Future<void> addPart(Part part) async {
    isAddPart = false;
    emit(state.copyWith(status: PartStatus.loading));
    List<Part>? newPart = state.parts;
    if (newPart != null || newPart!.isEmpty) {
      for (var element in newPart) {
        if (element.id == part.id) {
          return;
        }
      }
      await db.child(part.id).set({
        'id': part.id,
        'name': part.name,
      }).then((value) => {isAddPart = true});
      emit(state.copyWith(status: PartStatus.success));
    }
  }

  Future<void> getPart() async {
    emit(state.copyWith(status: PartStatus.loading));
    List<Part> newPart = [];
    final snapshot = await db.get();
    final data = jsonDecode(jsonEncode(snapshot.value));

    if (data == null || data.isEmpty) {
      emit(state.copyWith(parts: newPart, status: PartStatus.success));
      return;
    }
    Map<String, dynamic> newData = data as Map<String, dynamic>;

    newData.forEach(
      (key, value) {
        Part part;
        part = Part.fromJson(value);
        newPart.add(part);
        printYellow('part: ${part.id}');
      },
    );

    emit(state.copyWith(status: PartStatus.loading, parts: newPart));
  }

  Future<void> removePart(Part part) async {
    await db.child(part.id).remove().then((value) => {
          getPart(),
        });
  }

  Future<void> updatePart(Part part) async {
    await db.child(part.id).update({
      'name': part.name,
    });
    getPart();
  }
}
