import 'package:flutter/material.dart';

import 'components/futures.dart'
    show FutureMethodExample, FutureExampleWithUpdate;
import 'components/notifier.dart' show CounterExample;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Code Generator'),
      ),
      body: const Column(
        children: [
          FutureMethodExample(),
          CounterExample(),
          FutureExampleWithUpdate()
        ],
      ),
    );
  }
}
