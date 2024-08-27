import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';

abstract class GroceryRepository {
  Future<Either<Failure, List<GroceryEntity>>> getAllGroceries();
  Future<Either<Failure, GroceryEntity>> getGrocery(String id);
}
