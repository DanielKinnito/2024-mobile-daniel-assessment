import 'package:myapp/features/groceries/data/models/grocery_model.dart';

abstract class GroceryRemoteDataSource {
  Future<List<GroceryModel>> getAllGroceries();
  Future<GroceryModel> getGrocery(String id);
}