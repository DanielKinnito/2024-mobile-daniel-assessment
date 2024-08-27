import 'dart:convert';

import 'package:myapp/core/error/exception.dart';
import 'package:myapp/features/groceries/data/datasources/local/grocery_local_data_source.dart';
import 'package:myapp/features/groceries/data/models/grocery_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroceryLocalDataSourceImpl implements GroceryLocalDataSource {
  final SharedPreferences _sharedPreferences;

  GroceryLocalDataSourceImpl({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  @override
  Future<List<GroceryModel>> getAllGroceries() async {
    final jsonString = _sharedPreferences.getString('');
    if (jsonString != null) {
      final List<dynamic> productsJson =
          json.decode(jsonString)['data'] as List<dynamic>;
      return productsJson.map((dynamic json) {
        if (json is Map<String, dynamic>) {
          return GroceryModel.fromJson(json);
        } else {
          throw CacheException(
              message: 'get all not wroking'); // Handle unexpected data types
        }
      }).toList();
    } else {
      throw CacheException(message: 'get all found nothing');
    }
  }

  @override
  Future<GroceryModel> getGrocery(String id) async {
    final jsonString = _sharedPreferences.getString('product_$id');
    if (jsonString != null) {
      try {
        final Map<String, dynamic> jsonMap =
            json.decode(jsonString) as Map<String, dynamic>;
        return GroceryModel.fromJson(jsonMap);
      } catch (e) {
        throw CacheException(
            message: 'get grocery not working'); // Handle JSON parsing errors
      }
    } else {
      throw CacheException(message: 'get grocery found nothing');
    }
  }

  @override
  Future<List<GroceryModel>> cacheAllGroceries(
      List<GroceryModel> groceries) async {
    final jsonList = groceries.map((grocery) => grocery.toJson()).toList();
    final jsonString = json.encode({'data': jsonList});
    final result = await _sharedPreferences.setString('groceries', jsonString);
    if (result) {
      // Return the first product if the list is not empty
      if (groceries.isNotEmpty) {
        return groceries;
      } else {
        throw CacheException(
            message:
                'cahce all not working when groceries'); // Handle empty product list
      }
    } else {
      throw CacheException(message: 'cache with nothing');
    }
  }
}
