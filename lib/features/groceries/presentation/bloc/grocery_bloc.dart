import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';
import 'package:myapp/features/groceries/domain/usecase/get_all_groceries.dart';
import 'package:myapp/features/groceries/domain/usecase/get_grocery.dart';

import '../../../../core/usecase/usecase.dart';

part 'grocery_event.dart';
part 'grocery_state.dart';

class GroceryBloc extends Bloc<GroceryEvent, GroceryState> {
  final GetAllGroceries getAllGroceries;
  final GetGrocery getGrocery;

  GroceryBloc({
    required this.getAllGroceries,
    required this.getGrocery,
  }) : super(const GroceryInitial([])) {
    on<GroceriesLoadRequested>(_onLoadGroceriesRequested);
  }

  Future<void> _onLoadGroceriesRequested(
      GroceriesLoadRequested event, Emitter<GroceryState> emit) async {
    emit(GroceriesLoadInProgress(state.groceries));

    final groceriesOrFailure = await getAllGroceries(NoParams());

    groceriesOrFailure.fold(
      (failure) {
        print('Error loading groceries: ${failure.message}');
        emit(GroceryFailure(failure.message, state.groceries));
      },
      (groceries) {
        print('Products loaded: $groceries');
        emit(GroceriesLoadSuccess(groceries));
      },
    );
  }
}
