import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show Consumer, ConsumerWidget, WidgetRef;

import '../../providers/futures/futures.dart'
    show getNameProvider, getFutureNameProvider;

class FutureMethodExample extends ConsumerWidget {
  const FutureMethodExample({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameData = ref.watch(getNameProvider(id: 1));
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(nameData.value ?? 'Loading...'),
      ),
    );
  }
}

class FutureExampleWithUpdate extends ConsumerWidget {
  const FutureExampleWithUpdate({
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
            Consumer(builder: (context, state, _) {
              final nameData = state.watch(getFutureNameProvider);
              return Text(
                nameData.value ?? 'Loading...',
              );
            }),
            ElevatedButton(
              onPressed: () {
                ref.read(getFutureNameProvider.notifier).updateId();
              },
              child: const Text('Add Counter ID'),
            ),
          ],
        ),
      ),
    );
  }
}
