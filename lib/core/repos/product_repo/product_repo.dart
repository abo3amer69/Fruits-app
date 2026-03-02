import 'package:dartz/dartz.dart';
import 'package:fruits_apps/core/entities/product_entity.dart';
import 'package:fruits_apps/core/errors/failures.dart';

abstract class ProductRepo {
    Future<Either<Failure, List<ProductEntity>>> getAllProducts();
    Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
