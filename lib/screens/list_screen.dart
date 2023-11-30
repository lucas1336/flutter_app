import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This is the List Screen of the app',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
