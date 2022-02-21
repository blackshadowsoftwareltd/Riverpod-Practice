import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/provider.dart';

/// extends ConsumerWidget
class CounterDemo extends ConsumerWidget {
  const CounterDemo({Key? key}) : super(key: key);

  @override

  /// build (_,WidgetRef ref)
  Widget build(BuildContext context, WidgetRef widgetRef) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod')),
      body: Center(child: Consumer(builder: (_, ref, __) {
        /// watch
        final _count = ref.watch(count);
        return Text(
          _count.toString(),
          style: const TextStyle(fontSize: 50),
        );
      })),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          /// increment
          widgetRef.read(count.state).state++;

          /// or
          final _ref = widgetRef.read(count.state);
          _ref.state = _ref.state + 1;
        },
      ),
    );
  }
}
