import 'package:myapp/features/groceries/data/models/grocery_model.dart';

abstract class GroceryLocalDataSource {
  Future<List<GroceryModel>> getAllGroceries();
  Future<GroceryModel> getGrocery(String id);
  Future<List<GroceryModel>> cacheAllGroceries(List<GroceryModel> groceries);
}
