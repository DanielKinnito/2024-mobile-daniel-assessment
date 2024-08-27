import 'package:flutter/material.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';
import 'package:myapp/features/groceries/presentation/widgets/basket_card.dart';
import 'package:myapp/features/groceries/presentation/widgets/bottom_nav_basket.dart';

class BasketPage extends StatelessWidget {
  final List<GroceryEntity>
      basketItems; // List of groceries added to the basket

  const BasketPage({
    super.key,
    required this.basketItems,
  });

  @override
  Widget build(BuildContext context) {
    double subtotal = basketItems.fold(
      0.0,
      (sum, item) => sum + (item.price * 1),
    );

    double totalDiscount = basketItems.fold(
      0.0,
      (sum, item) => sum + item.discount,
    );

    double total = subtotal - totalDiscount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Basket'),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order Summary Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order Summary',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    // Handle "Add more" action
                  },
                  child: const Text('Add more'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Display Basket Items
            Expanded(
              child: ListView.builder(
                itemCount: basketItems.length,
                itemBuilder: (context, index) {
                  final item = basketItems[index];
                  return BasketCard(
                    grocery: item,
                    onRemove: () {
                      basketItems.remove(item);
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            // Basket Summary
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal'),
                    Text('€${subtotal.toStringAsFixed(2)}'),
                  ],
                ),
                const SizedBox(height: 8),
                // Delivery Fee
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Delivery Fee'),
                    Text('Free'),
                  ],
                ),
                const SizedBox(height: 8),
                // Discount
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Discount'),
                    Text('€${totalDiscount.toStringAsFixed(2)}'),
                  ],
                ),
                const Divider(),
                // Total
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('€${total.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBasket(
        onAddToBasket: () {},
        totalAmount: total.toString(),
      ),
    );
  }
}
