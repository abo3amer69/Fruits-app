import 'package:dartz/dartz.dart';
import 'package:fruits_apps/core/entities/product_entity.dart';
import 'package:fruits_apps/core/errors/failures.dart';
import 'package:fruits_apps/core/repos/product_repo/product_repo.dart';
import 'package:fruits_apps/core/services/database_services.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl(this.databaseServices);
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }
}
