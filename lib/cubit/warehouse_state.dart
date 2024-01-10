import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/models/warehouse.dart';

part 'warehouse_state.g.dart';

enum WarehousesStatus { init, loading, success, error }

@CopyWith()
class WarehouseState extends Equatable {
  const WarehouseState({this.warehouses, this.status = WarehousesStatus.init});
  final List<Warehouses>? warehouses;
  final WarehousesStatus status;

  @override
  List<Object?> get props => [warehouses, status];
}
