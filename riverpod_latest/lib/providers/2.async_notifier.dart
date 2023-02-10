import 'dart:async' show FutureOr;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show AsyncNotifierProvider, AsyncNotifier, AsyncData;

final homeProvider = AsyncNotifierProvider<_Home, String>(_Home.new);

class _Home extends AsyncNotifier<String> {
  @override
  FutureOr<String> build() async => await getString();

  void setString(String s) => state = AsyncData(s);

  Future<String> getString() async => state.value ?? 'Riverpod Latest';
}

Future<String> getString() async => 'Riverpod Latest';
