import 'dart:async' show Future, FutureOr;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show AutoDisposeAsyncNotifier, AutoDisposeAsyncNotifierProvider, AsyncData;

final homeProvider = AutoDisposeAsyncNotifierProvider<_Home, String>(_Home.new);

class _Home extends AutoDisposeAsyncNotifier<String> {
  @override
  FutureOr<String> build() async => await getData();

  Future<void> setString(String s) async => state = AsyncData(s);

  Future<String> getString() async => state.value ?? 'AsyncData is null';
}

Future<String> getData() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'data';
}
