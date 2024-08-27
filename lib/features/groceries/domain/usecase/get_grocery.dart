import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';
import 'package:myapp/features/groceries/domain/repositories/grocery_repository.dart';

class GetGrocery implements
    UseCase<GroceryEntity, GetGroceryParams> {
  final GroceryRepository repository;

  GetGrocery(this.repository);

  @override
  Future<Either<Failure, GroceryEntity>> call(GetGroceryParams params) async {
    return await repository.getGrocery(params.id);
  }
  
}

class GetGroceryParams{
  final String id;
  GetGroceryParams({required this.id});
}
