import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final ScrollController scrollController;
  const HomePage({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        itemCount: 25,
        itemBuilder: (ctx, index) => ListTile(
          title: Text('Title ${index + 1}'),
        ),
        separatorBuilder: (ctx, index) => const Divider(
          thickness: 2,
          height: 0,
        ),
      ),
    );
  }
}
