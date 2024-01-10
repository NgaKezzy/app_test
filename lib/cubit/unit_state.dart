import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/models/unit.dart';

part 'unit_state.g.dart';

enum UnitStatus { init, loading, success, error }

@CopyWith()
class UnitState extends Equatable {
  const UnitState({this.units, this.status = UnitStatus.init});
  final List<Unit>? units;
  final UnitStatus status;

  @override
  List<Object?> get props => [units, status];
}

