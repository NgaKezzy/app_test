// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ReceiptStateCWProxy {
  ReceiptState goodsVotes(List<GoodsVotes>? goodsVotes);

  ReceiptState receipts(List<Receipt>? receipts);

  ReceiptState status(ReceiptStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReceiptState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReceiptState(...).copyWith(id: 12, name: "My name")
  /// ````
  ReceiptState call({
    List<GoodsVotes>? goodsVotes,
    List<Receipt>? receipts,
    ReceiptStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfReceiptState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfReceiptState.copyWith.fieldName(...)`
class _$ReceiptStateCWProxyImpl implements _$ReceiptStateCWProxy {
  final ReceiptState _value;

  const _$ReceiptStateCWProxyImpl(this._value);

  @override
  ReceiptState goodsVotes(List<GoodsVotes>? goodsVotes) =>
      this(goodsVotes: goodsVotes);

  @override
  ReceiptState receipts(List<Receipt>? receipts) => this(receipts: receipts);

  @override
  ReceiptState status(ReceiptStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ReceiptState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ReceiptState(...).copyWith(id: 12, name: "My name")
  /// ````
  ReceiptState call({
    Object? goodsVotes = const $CopyWithPlaceholder(),
    Object? receipts = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return ReceiptState(
      goodsVotes: goodsVotes == const $CopyWithPlaceholder()
          ? _value.goodsVotes
          // ignore: cast_nullable_to_non_nullable
          : goodsVotes as List<GoodsVotes>?,
      receipts: receipts == const $CopyWithPlaceholder()
          ? _value.receipts
          // ignore: cast_nullable_to_non_nullable
          : receipts as List<Receipt>?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ReceiptStatus,
    );
  }
}

extension $ReceiptStateCopyWith on ReceiptState {
  /// Returns a callable class that can be used as follows: `instanceOfReceiptState.copyWith(...)` or like so:`instanceOfReceiptState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ReceiptStateCWProxy get copyWith => _$ReceiptStateCWProxyImpl(this);
}
