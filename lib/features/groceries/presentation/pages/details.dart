import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/features/groceries/presentation/widgets/bottom_nav_widget.dart';
import 'package:myapp/features/groceries/presentation/widgets/details_card.dart';
import 'package:myapp/features/groceries/presentation/widgets/like_button.dart'; // Import the LikeButton widget
import '../../domain/entities/grocery_entity.dart'; // Updated to use GroceryEntity
import '../bloc/grocery_bloc.dart'; // Updated to use GroceryBloc

class Details extends StatefulWidget {
  final GroceryEntity grocery; // Updated to use GroceryEntity

  const Details({super.key, required this.grocery}); // Updated parameter type

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _counter = 0;
  bool _isLiked = false; // State to track whether the item is liked

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  void _onLikeChanged(bool isLiked) {
    setState(() {
      _isLiked = isLiked;
    });
  }

  void _onAddToBasket() {
    // Handle add to basket action
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GroceryBloc, GroceryState>(
      listener: (context, state) {
        if (state is GroceryFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: Color.fromRGBO(63, 81, 243, 1),
            ),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.grocery.imageUrl, // Updated to use grocery.imageUrl
                  fit: BoxFit.cover,
                  height: 250, // Adjust the height as needed
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: LikeButton(
                    isLiked: _isLiked,
                    onLikeChanged: _onLikeChanged,
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DetailsCard(
                        grocery: widget.grocery,
                      ), // Ensure this widget is compatible with GroceryEntity
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavWidget(
          counter: _counter,
          onIncrement: _incrementCounter,
          onDecrement: _decrementCounter,
          onAddToBasket: _onAddToBasket,
        ),
      ),
    );
  }
}
