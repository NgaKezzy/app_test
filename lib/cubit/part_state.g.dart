// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PartStateCWProxy {
  PartState parts(List<Part>? parts);

  PartState status(PartStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PartState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PartState(...).copyWith(id: 12, name: "My name")
  /// ````
  PartState call({
    List<Part>? parts,
    PartStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPartState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPartState.copyWith.fieldName(...)`
class _$PartStateCWProxyImpl implements _$PartStateCWProxy {
  final PartState _value;

  const _$PartStateCWProxyImpl(this._value);

  @override
  PartState parts(List<Part>? parts) => this(parts: parts);

  @override
  PartState status(PartStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PartState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PartState(...).copyWith(id: 12, name: "My name")
  /// ````
  PartState call({
    Object? parts = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return PartState(
      parts: parts == const $CopyWithPlaceholder()
          ? _value.parts
          // ignore: cast_nullable_to_non_nullable
          : parts as List<Part>?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as PartStatus,
    );
  }
}

extension $PartStateCopyWith on PartState {
  /// Returns a callable class that can be used as follows: `instanceOfPartState.copyWith(...)` or like so:`instanceOfPartState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PartStateCWProxy get copyWith => _$PartStateCWProxyImpl(this);
}
