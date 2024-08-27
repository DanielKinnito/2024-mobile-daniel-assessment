import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final Function(bool) onLikeChanged;

  const LikeButton({
    Key? key,
    required this.isLiked,
    required this.onLikeChanged,
  }) : super(key: key);

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.onLikeChanged(!widget.isLiked);
          });
        },
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.isLiked
                  ? const Color.fromRGBO(255, 99, 71, 1)
                  : Colors.grey,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              widget.isLiked ? Icons.favorite : Icons.favorite_border,
              color: widget.isLiked
                  ? const Color.fromRGBO(255, 99, 71, 1)
                  : Colors.grey,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
