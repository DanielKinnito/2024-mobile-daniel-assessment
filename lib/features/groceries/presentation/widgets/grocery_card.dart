import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/features/groceries/domain/entities/grocery_entity.dart';
import 'like_button.dart'; // Ensure this path is correct

class GroceryCard extends StatelessWidget {
  final GroceryEntity grocery;
  final VoidCallback onTap;
  final bool isLiked; // Added property to handle liked state
  final ValueChanged<bool> onLikeChanged; // Added callback for like changes

  const GroceryCard({
    super.key,
    required this.grocery,
    required this.onTap,
    required this.isLiked, // Required to reflect the liked state
    required this.onLikeChanged, // Callback to handle like changes
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Image section
                LayoutBuilder(
                  builder: (context, constraints) {
                    final imageHeight = constraints.maxWidth * 0.75; // Adjust ratio as needed
                    return SizedBox(
                      height: imageHeight,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16.0),
                          topRight: Radius.circular(16.0),
                        ),
                        child: Image.network(
                          grocery.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        grocery.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      // Rating
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${grocery.rating}', // Dynamic rating
                            style: GoogleFonts.roboto(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // Price and Discount
                      Row(
                        children: [
                          Text(
                            '£${grocery.price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '£${grocery.discount}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: LikeButton(
                isLiked: isLiked, // Use the passed isLiked property
                onLikeChanged: onLikeChanged, // Use the callback for like changes
              ),
            ),
          ],
        ),
      ),
    );
  }
}
