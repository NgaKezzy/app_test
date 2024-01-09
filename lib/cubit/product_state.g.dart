// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProductStateCWProxy {
  ProductState products(List<Product>? products);

  ProductState status(ProductStatus status);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductState call({
    List<Product>? products,
    ProductStatus? status,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProductState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProductState.copyWith.fieldName(...)`
class _$ProductStateCWProxyImpl implements _$ProductStateCWProxy {
  final ProductState _value;

  const _$ProductStateCWProxyImpl(this._value);

  @override
  ProductState products(List<Product>? products) => this(products: products);

  @override
  ProductState status(ProductStatus status) => this(status: status);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProductState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProductState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProductState call({
    Object? products = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
  }) {
    return ProductState(
      products: products == const $CopyWithPlaceholder()
          ? _value.products
          // ignore: cast_nullable_to_non_nullable
          : products as List<Product>?,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as ProductStatus,
    );
  }
}

extension $ProductStateCopyWith on ProductState {
  /// Returns a callable class that can be used as follows: `instanceOfProductState.copyWith(...)` or like so:`instanceOfProductState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProductStateCWProxy get copyWith => _$ProductStateCWProxyImpl(this);
}
