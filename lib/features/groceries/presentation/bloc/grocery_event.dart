part of 'grocery_bloc.dart';

sealed class GroceryEvent extends Equatable {
  const GroceryEvent();

  @override
  List<Object> get props => [];
}

class GroceriesLoadRequested extends GroceryEvent {
  const GroceriesLoadRequested();
}
