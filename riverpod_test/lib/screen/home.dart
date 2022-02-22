import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/provider/state_provider.dart';

import '../provider/provider.dart';

/// extends ConsumerWidget
class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override

  /// build (_,WidgetRef ref)
  Widget build(BuildContext context, WidgetRef widgetRef) {
    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: Consumer(builder: (_, ref, __) {
          /// It will watch a property that is specified in an object. won't watch other properties of an object.
          // final _data = ref.watch(providerData); // without title
          // final _data = ref
          //     .watch(providerData('Remon Ahammad')); // with title. using method
          return Text(
            ' _data.toString()',
            style: const TextStyle(fontSize: 20),
          );
        })),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          /// increment

          // final _ref = widgetRef.read(countObject.state);
          // _ref.state = _ref.state.copyWith(counter: _ref.state.counter + 1);
        },
      ),
    );
  }
}
