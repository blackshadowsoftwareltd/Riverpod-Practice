import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/provider.dart';

/// extends ConsumerWidget
class CounterWithObjectClass extends ConsumerWidget {
  const CounterWithObjectClass({Key? key}) : super(key: key);

  @override

  /// build (_,WidgetRef ref)
  Widget build(BuildContext context, WidgetRef widgetRef) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod')),
      body: Center(child: Consumer(builder: (_, ref, __) {
        /// watch ObjectClass value
        /// It will watch the object's all properties.
        // final _countObj = ref.watch(countObject);

        /// It will watch a property that is specified in an object. won't watch other properties of an object.
        final _counter =
            ref.watch(countObject.select((value) => value.counter));
        return Text(
          _counter.toString(),
          style: const TextStyle(fontSize: 50),
        );
      })),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          /// increment

          final _ref = widgetRef.read(countObject.state);
          _ref.state = _ref.state.copyWith(counter: _ref.state.counter + 1);
        },
      ),
    );
  }
}
