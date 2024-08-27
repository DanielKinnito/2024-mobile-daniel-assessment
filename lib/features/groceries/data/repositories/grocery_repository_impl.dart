import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/exception.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/network/network_info.dart';
import 'package:myapp/features/groceries/data/datasources/local/grocery_local_data_source.dart';
import 'package:myapp/features/groceries/data/datasources/remote/grocery_remote_data_source.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';
import 'package:myapp/features/groceries/domain/repositories/grocery_repository.dart';

class GroceryRepositoryImpl extends GroceryRepository {
  final GroceryRemoteDataSource remoteDataSource;
  final GroceryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GroceryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<GroceryEntity>>> getAllGroceries() async {
    if (await networkInfo.isConnected) {
      try {
        final groceries = await remoteDataSource.getAllGroceries();
        localDataSource.cacheAllGroceries(groceries);
        return Right(groceries);
      } on ServerException catch (e) {
        print(e);
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final groceries = await localDataSource.getAllGroceries();
        return Right(groceries);
      } on CacheException catch (e) {
        print(e);
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, GroceryEntity>> getGrocery(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final groceries = await remoteDataSource.getAllGroceries();
        localDataSource.cacheAllGroceries(groceries);
        return Right(groceries as GroceryEntity);
      } on ServerException catch (e) {
        print(e);
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final groceries = await localDataSource.getAllGroceries();
        return Right(groceries as GroceryEntity);
      } on CacheException catch (e) {
        print(e);
        return Left(CacheFailure(e.message));
      }
    }
  }
}
