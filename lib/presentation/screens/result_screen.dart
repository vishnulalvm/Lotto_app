import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(251, 255, 249, 249),
      appBar: AppBar(
        title: const Text("Result View"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('1st Prize-Rs.7,000,000/- [70 Lakhs]'),
          Text('1st Prize-Rs.7,000,000/- [70 Lakhs]'),
          Text('1st Prize-Rs.7,000,000/- [70 Lakhs]'),
          Text('1st Prize-Rs.7,000,000/- [70 Lakhs]'),
          Text('1st Prize-Rs.7,000,000/- [70 Lakhs]'),
          Text('1st Prize-Rs.7,000,000/- [70 Lakhs]'),
          Text('1st Prize-Rs.7,000,000/- [70 Lakhs]'),
        ],
      ),
    );
  }
}
