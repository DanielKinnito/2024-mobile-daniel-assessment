import 'package:myapp/features/groceries/domain/entities/topping_entity.dart';

class ToppingModel extends ToppingEntity {
  
  
  ToppingModel({
    required super.name,
    required super.price,
    required super.id,
  });

  factory ToppingModel.fromJson(Map<String, dynamic> json) {
    return ToppingModel(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
      id: json['id'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'id': id,
    };
  }

  // Mapping
  ToppingEntity toEntity() {
    return ToppingEntity(
      name: name,
      price: price,
      id: id,
    );
  }

  ToppingModel toModel() {
    return ToppingModel(
      name: name,
      price: price,
      id: id,
    );
  }
}
