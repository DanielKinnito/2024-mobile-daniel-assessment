import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  final int counter;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onAddToBasket;

  const BottomNavWidget({
    super.key,
    required this.counter,
    required this.onIncrement,
    required this.onDecrement,
    required this.onAddToBasket,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 9,
          right: 9,
        ),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: onDecrement,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '$counter',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: onIncrement,
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: onAddToBasket,
                icon: const Icon(
                  Icons.shopping_basket,
                  color: Colors.white,
                ),
                label: const Text(
                  'Add to basket',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor:
                      const Color.fromRGBO(255, 99, 71, 1), // Button color
                  backgroundColor:
                      const Color.fromRGBO(255, 99, 71, 1), // Button color
                  fixedSize: Size(193, 53),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
