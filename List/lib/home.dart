import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final datas = ref.watch(list);
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder: (context, index) {
          final data = datas[index];
          return ListTile(
            ///?
            leading: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => ref
                    .read(list.notifier)
                    .update(index, Random().nextInt(100).toString())),

            ///?
            title: Text(data),

            ///?
            trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => ref.read(list.notifier).remove(data)),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton.small(
            onPressed: () => ref.read(list.notifier).deleteAll(),
            child: const Icon(Icons.delete_sweep_outlined),
          ),
          FloatingActionButton.small(
            onPressed: () =>
                ref.read(list.notifier).add(Random().nextInt(100).toString()),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
