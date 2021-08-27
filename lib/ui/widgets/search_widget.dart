import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;

  const SearchWidget({
    Key? key,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(left: 40, right: 40),
            child: TextField(controller: controller),
          ),
          ElevatedButton(
            onPressed: onPressed,
            child: Text('Add Todo'),
          )
        ],
      );
}
