import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier_p_riverpod/provider.dart';

void main() => runApp(const ProviderScope(child: MaterialApp(home: Home())));

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Notifier Provider')),
      body: const UsersListView(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref
            .read(usersList.notifier)
            .add(User(name: 'Remon', age: Random().nextInt(25)));
      }),
    );
  }
}

class UsersListView extends ConsumerWidget {
  const UsersListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<User> users = ref.watch(usersList).users;
    final userRef = ref.read(usersList.notifier);

    return ListView(
      children: [
        for (final x in users)
          ListTile(
            title: Text(x.name),
            subtitle: Row(children: [
              InkWell(
                  child: const Icon(Icons.delete),
                  onTap: () => userRef.remove(x)),
              InkWell(
                  child: const Icon(Icons.edit),
                  onTap: () => userRef.Update(
                      users.indexOf(x), User(name: 'Remon Ahammad', age: 10))),
            ]),
            trailing: Text(x.age.toString()),
          ),
      ],
    );
  }
}
