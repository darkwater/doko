import 'package:flutter/material.dart';

class SearchSheet extends StatelessWidget {
  const SearchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Search'),
        ),
      ],
    );
  }
}
