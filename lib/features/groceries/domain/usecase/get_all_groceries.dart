import 'package:dartz/dartz.dart';
import 'package:myapp/core/error/failure.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';
import 'package:myapp/features/groceries/domain/repositories/grocery_repository.dart';

class GetAllGroceries implements UseCase<List<GroceryEntity>, NoParams> {
  final GroceryRepository repository;

  GetAllGroceries(this.repository);

  @override
  Future<Either<Failure, List<GroceryEntity>>> call(NoParams params) async {
    return await repository.getAllGroceries();
  }
}
