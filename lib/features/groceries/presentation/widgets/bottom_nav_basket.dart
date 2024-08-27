import 'package:flutter/material.dart';

class BottomNavBasket extends StatelessWidget {
  final String totalAmount;
  final VoidCallback onAddToBasket;

  const BottomNavBasket({
    super.key,
    required this.totalAmount,
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
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Display the total amount
              Text(
                'Total: $totalAmount',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Add to Basket Button
              ElevatedButton(
                onPressed: onAddToBasket,
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromRGBO(255, 99, 71, 1), // Button color
                  backgroundColor: const Color.fromRGBO(255, 99, 71, 1), // Button color,
                  fixedSize: const Size(193, 53),
                ),
                child: const Text(
                  'Place Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
