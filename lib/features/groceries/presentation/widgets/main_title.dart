import 'package:flutter/material.dart';

// ignore: camel_case_types
class MainTitle extends StatelessWidget {
  const MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        children: [
          SizedBox(width: 50,),
          Text('🍔Burger'),
        ],
      ),
    );
  }
}