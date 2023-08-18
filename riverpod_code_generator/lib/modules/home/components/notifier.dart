import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Consumer, ConsumerWidget, WidgetRef;

import '../../providers/notifiers/notifier.dart' show counterProvider;

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
