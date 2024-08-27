import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';
import 'package:myapp/features/groceries/presentation/bloc/grocery_bloc.dart';
import 'package:myapp/features/groceries/presentation/widgets/grocery_card.dart';
import 'package:myapp/features/groceries/presentation/widgets/main_title.dart';
import 'package:myapp/features/groceries/presentation/widgets/search_bar_widget.dart';

import '../../../../injection_container.dart'; // Assuming you are using dependency injection

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<GroceryEntity> likedGroceries = {}; // Set of liked groceries

  void _toggleLike(GroceryEntity grocery) {
    setState(() {
      if (likedGroceries.contains(grocery)) {
        likedGroceries.remove(grocery);
      } else {
        likedGroceries.add(grocery);
      }
    });
  }

  bool _isLiked(GroceryEntity grocery) {
    return likedGroceries.contains(grocery);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = GroceryBloc(
          getAllGroceries: sl(), // Using the service locator (sl) for DI
          getGrocery: sl(),
        );
        bloc.add(
            GroceriesLoadRequested()); // Trigger the event to load groceries
        return bloc;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.shopping_basket_outlined),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/basket',
                arguments: likedGroceries.toList(),
              );
            },
          ),
          title: const MainTitle(),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              // Search Bar
              SearchBarWidget(
                controller: TextEditingController(),
                onSearch: () {
                  // Handle search action
                },
              ),
              // Displaying the groceries in a GridView
              Expanded(
                child: BlocBuilder<GroceryBloc, GroceryState>(
                  builder: (context, state) {
                    if (state is GroceriesLoadInProgress) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GroceriesLoadSuccess) {
                      return GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Two columns
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          childAspectRatio: 0.75, // Adjust for better fit
                        ),
                        itemCount: state.groceries.length,
                        itemBuilder: (context, index) {
                          final grocery = state.groceries[index];
                          return GroceryCard(
                            isLiked: _isLiked(
                                grocery), // Check if this grocery is liked
                            onLikeChanged: (isLiked) => _toggleLike(grocery),
                            grocery: grocery,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/details',
                                arguments: grocery,
                              );
                            },
                          );
                        },
                      );
                    } else if (state is GroceryFailure) {
                      return Center(child: Text(state.message));
                    } else {
                      return const Center(
                          child: Text('Failed to load Groceries'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
