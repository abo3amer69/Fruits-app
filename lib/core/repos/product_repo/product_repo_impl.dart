import 'package:dartz/dartz.dart';
import 'package:fruits_apps/core/entities/product_entity.dart';
import 'package:fruits_apps/core/errors/failures.dart';
import 'package:fruits_apps/core/models/product_model.dart';
import 'package:fruits_apps/core/repos/product_repo/product_repo.dart';
import 'package:fruits_apps/core/services/database_services.dart';
import 'package:fruits_apps/core/utils/backend_endpoint.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl(this.databaseServices);

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data =
          await databaseServices.getData(path: BackendEndpoint.getProducts)
              as List<Map<String, dynamic>>;
      List<ProductEntity> products = data
          .map((e) => ProductModel.fromJson(e).toEntity())
          .toList();
      return Right(products);
    } catch (e) {
      return left(ServerFailure('failed to grt product'));
    }
  }
}
