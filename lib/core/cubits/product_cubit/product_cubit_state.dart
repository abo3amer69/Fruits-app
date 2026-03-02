part of 'product_cubit_cubit.dart';

@immutable
sealed class ProductCubitState {}

final class ProductCubitInitial extends ProductCubitState {}

final class ProductLoading extends ProductCubitState {}
final class ProductFailure extends ProductCubitState {
  final String errMessage;

  ProductFailure(this.errMessage);
}
final class ProductSuccess extends ProductCubitState {
  final List<ProductEntity> products;

  ProductSuccess(this.products);
}
