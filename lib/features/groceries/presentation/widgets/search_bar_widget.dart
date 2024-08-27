import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Color.fromARGB(13, 31, 42, 55),
        borderRadius: BorderRadius.circular(6),
      ),  
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_outlined, color: Colors.black),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
                width: 17.2,
                height: 14,
                child: Image.asset('assets/images/equalizer_filter.png')),
          ),
          hintText: 'Search...',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          // context.read<SearchPageBloc>().add(SearchProductsEvent(query: value));
        },
      ),
    );
  }
}
