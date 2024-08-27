class Urls {
  static const String baseUrl =
      'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries';
  static String getAllGroceriesUrl() => baseUrl;
  static String getGroceryUrl(String id) => '$baseUrl/$id';
}
