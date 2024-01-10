// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UnitStateCWProxy {
  UnitState status(UnitStatus status);

  UnitState units(List<Unit>? units);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnitState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnitState(...).copyWith(id: 12, name: "My name")
  /// ````
  UnitState call({
    UnitStatus? status,
    List<Unit>? units,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUnitState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUnitState.copyWith.fieldName(...)`
class _$UnitStateCWProxyImpl implements _$UnitStateCWProxy {
  final UnitState _value;

  const _$UnitStateCWProxyImpl(this._value);

  @override
  UnitState status(UnitStatus status) => this(status: status);

  @override
  UnitState units(List<Unit>? units) => this(units: units);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UnitState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UnitState(...).copyWith(id: 12, name: "My name")
  /// ````
  UnitState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? units = const $CopyWithPlaceholder(),
  }) {
    return UnitState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as UnitStatus,
      units: units == const $CopyWithPlaceholder()
          ? _value.units
          // ignore: cast_nullable_to_non_nullable
          : units as List<Unit>?,
    );
  }
}

extension $UnitStateCopyWith on UnitState {
  /// Returns a callable class that can be used as follows: `instanceOfUnitState.copyWith(...)` or like so:`instanceOfUnitState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UnitStateCWProxy get copyWith => _$UnitStateCWProxyImpl(this);
}
