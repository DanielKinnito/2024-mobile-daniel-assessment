part of 'grocery_bloc.dart';

sealed class GroceryState extends Equatable {
  final List<GroceryEntity> groceries;

  const GroceryState(this.groceries);

  @override
  List<Object> get props => [];
}

class GroceryInitial extends GroceryState {
  const GroceryInitial(super.groceries);
}

class GroceriesLoadSuccess extends GroceryState {
  const GroceriesLoadSuccess(super.groceries);
}

class GroceriesLoadInProgress extends GroceryState {
  const GroceriesLoadInProgress(super.groceries);
}

class GroceryFailure extends GroceryState {
  final String message;

  const GroceryFailure(this.message, super.groceries);
}
