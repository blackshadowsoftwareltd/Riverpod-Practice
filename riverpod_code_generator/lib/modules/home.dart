import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_code_generator/modules/providers/notifiers/notifier.dart';

import 'providers/futures/futures.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Code Generator'),
      ),
      body: const Column(
        children: [FutureMethodExample(), CounterExample()],
      ),
    );
  }
}

class CounterExample extends ConsumerWidget {
  const CounterExample({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: const Text('Increment'),
            ),
            Consumer(builder: (context, state, _) {
              return Text(
                state.watch(counterProvider).toString(),
              );
            }),
            ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).decrement();
              },
              child: const Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}

class FutureMethodExample extends ConsumerWidget {
  const FutureMethodExample({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameData = ref.watch(getNameProvider(id: 1));
    return Text(nameData.value ?? 'Loading...');
  }
}
