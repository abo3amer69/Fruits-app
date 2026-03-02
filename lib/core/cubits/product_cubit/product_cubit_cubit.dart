import 'package:bloc/bloc.dart';
import 'package:fruits_apps/core/entities/product_entity.dart';
import 'package:fruits_apps/core/repos/product_repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_cubit_state.dart';

class ProductCubit extends Cubit<ProductCubitState> {
  ProductCubit(this.productRepo) : super(ProductCubitInitial());
  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductFailure(failure.message)),
      (products) => emit(ProductSuccess(products)),
    );
  }

  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductFailure(failure.message)),
      (products) => emit(ProductSuccess(products)),
    );
  }
}
