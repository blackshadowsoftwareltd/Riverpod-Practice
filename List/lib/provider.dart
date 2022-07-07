import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListNotifier extends StateNotifier<List<String>> {
  ListNotifier() : super([]);

  ///? add
  void add(String value) {
    state = [...state, value];
  }

  ///? remove
  void remove(String value) {
    state = [
      for (var x in state)
        if (x != value) x
    ];
  }

  ///? update
  //! if it is a model type? use> newValue.copyWith(....)
  void update(String old, String newValue) {
    state = [
      for (var x in state)
        if (x == old) newValue else x
    ];
  }

  ///? delete all
  void deleteAll() {
    state = [];
  }
}

final list =
    StateNotifierProvider<ListNotifier, List<String>>((ref) => ListNotifier());
