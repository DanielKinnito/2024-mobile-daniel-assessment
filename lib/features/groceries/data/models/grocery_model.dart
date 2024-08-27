  import 'package:myapp/features/groceries/data/models/topping_model.dart';
  import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';

  class GroceryModel extends GroceryEntity {
    final String id;
    final String title;
    final String description;
    final double price;
    final String imageUrl;
    final double rating;
    final double discount;
    final List<ToppingModel> options;

    GroceryModel({
      required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      required this.rating,
      required this.discount,
      required this.options,
    }) : super(id: id, title: title, imageUrl: imageUrl, rating: rating, price: price, discount: discount, description: description, options: options);

    factory GroceryModel.fromJson(Map<String, dynamic> json) {
      return GroceryModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        price: json['price'] != null ? (json['price'] as num).toDouble() : 0.0,
        imageUrl: json['imageUrl'] ?? '',
        rating: json['rating'] != null ? (json['rating'] as num).toDouble() : 0.0,
        discount:
            json['discount'] != null ? (json['discount'] as num).toDouble() : 0.0,
        options: json['options'] != null
            ? (json['options'] as List<dynamic>)
                .map(
                    (item) => ToppingModel.fromJson(item as Map<String, dynamic>))
                .toList()
            : [],
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'imageUrl': imageUrl,
        'rating': rating,
        'discount': discount,
        'options': options,
      };
    }

    // Mapping

    GroceryEntity toEntity() => GroceryEntity(
          id: id,
          title: title,
          description: description,
          price: price,
          imageUrl: imageUrl,
          rating: rating,
          discount: discount,
          options: options,
        );

    GroceryModel toModel() => GroceryModel(
          id: id,
          title: title,
          description: description,
          price: price,
          imageUrl: imageUrl,
          rating: rating,
          discount: discount,
          options: options,
        );
  }
