// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warehouse_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$WarehouseStateCWProxy {
  WarehouseState status(WarehousesStatus status);

  WarehouseState warehouses(List<Warehouses>? warehouses);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WarehouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WarehouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  WarehouseState call({
    WarehousesStatus? status,
    List<Warehouses>? warehouses,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfWarehouseState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfWarehouseState.copyWith.fieldName(...)`
class _$WarehouseStateCWProxyImpl implements _$WarehouseStateCWProxy {
  final WarehouseState _value;

  const _$WarehouseStateCWProxyImpl(this._value);

  @override
  WarehouseState status(WarehousesStatus status) => this(status: status);

  @override
  WarehouseState warehouses(List<Warehouses>? warehouses) =>
      this(warehouses: warehouses);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `WarehouseState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// WarehouseState(...).copyWith(id: 12, name: "My name")
  /// ````
  WarehouseState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? warehouses = const $CopyWithPlaceholder(),
  }) {
    return WarehouseState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as WarehousesStatus,
      warehouses: warehouses == const $CopyWithPlaceholder()
          ? _value.warehouses
          // ignore: cast_nullable_to_non_nullable
          : warehouses as List<Warehouses>?,
    );
  }
}

extension $WarehouseStateCopyWith on WarehouseState {
  /// Returns a callable class that can be used as follows: `instanceOfWarehouseState.copyWith(...)` or like so:`instanceOfWarehouseState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$WarehouseStateCWProxy get copyWith => _$WarehouseStateCWProxyImpl(this);
}
