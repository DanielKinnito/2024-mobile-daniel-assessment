import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:myapp/core/constants/constant.dart';
import 'package:myapp/core/error/exception.dart';
import 'package:myapp/features/groceries/data/datasources/remote/grocery_remote_data_source.dart';
import 'package:myapp/features/groceries/data/models/grocery_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GroceryRemoteDataSourceImpl implements GroceryRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;

  GroceryRemoteDataSourceImpl({
    required this.client,
    required this.sharedPreferences,
  });

  @override
  Future<List<GroceryModel>> getAllGroceries() async {
    final response = await client.get(
      Uri.parse(Urls.getAllGroceriesUrl()),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      final List<GroceryModel> products = jsonData
          .map((productJson) => GroceryModel.fromJson(productJson))
          .toList();
      return products;
    } else {
      throw ServerException(message: 'remote-impl for all');
    }
  }

  @override
  Future<GroceryModel> getGrocery(String id) async {
    final response = await client.get(
      Uri.parse(Urls.getGroceryUrl(id)),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body)['data'];
      final product = GroceryModel.fromJson(data);
      return product;
    } else {
      throw ServerException(message: 'remmote-impl');
    }
  }
}
