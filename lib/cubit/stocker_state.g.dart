// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stocker_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StockerStateCWProxy {
  StockerState status(StockerStatus status);

  StockerState stockers(List<Stocker>? stockers);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockerState(...).copyWith(id: 12, name: "My name")
  /// ````
  StockerState call({
    StockerStatus? status,
    List<Stocker>? stockers,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStockerState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStockerState.copyWith.fieldName(...)`
class _$StockerStateCWProxyImpl implements _$StockerStateCWProxy {
  final StockerState _value;

  const _$StockerStateCWProxyImpl(this._value);

  @override
  StockerState status(StockerStatus status) => this(status: status);

  @override
  StockerState stockers(List<Stocker>? stockers) => this(stockers: stockers);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StockerState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StockerState(...).copyWith(id: 12, name: "My name")
  /// ````
  StockerState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? stockers = const $CopyWithPlaceholder(),
  }) {
    return StockerState(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as StockerStatus,
      stockers: stockers == const $CopyWithPlaceholder()
          ? _value.stockers
          // ignore: cast_nullable_to_non_nullable
          : stockers as List<Stocker>?,
    );
  }
}

extension $StockerStateCopyWith on StockerState {
  /// Returns a callable class that can be used as follows: `instanceOfStockerState.copyWith(...)` or like so:`instanceOfStockerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StockerStateCWProxy get copyWith => _$StockerStateCWProxyImpl(this);
}
