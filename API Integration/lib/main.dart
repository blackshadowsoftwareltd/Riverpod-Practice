import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api/providers/api_provider.dart';

import 'models/model.dart';
import 'screens/gamer_list.dart';

void main() => runApp(const ProviderScope(child: MaterialApp(home: Home())));

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Integration')),
      body: Consumer(builder: (_, ref, __) {
        /// AsyncValue
        AsyncValue<List<GamerModel>?> _gamerList = ref.watch(gamerList);

        return _gamerList.when(
          loading: () => const Center(
            child: SingleChildScrollView(),
          ),
          error: (error, stack) => Center(
            child: Text('Error : $error'),
          ),
          data: (data) => GamerList(gamers: data!),
        );
      }),
    );
  }
}
