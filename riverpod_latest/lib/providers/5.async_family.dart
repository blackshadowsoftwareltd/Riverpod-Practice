import 'dart:async' show FutureOr;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show AsyncData, AsyncNotifierProviderFamily, FamilyAsyncNotifier;

final homeProvider =
    AsyncNotifierProviderFamily<_Home, String, String>(_Home.new);

class _Home extends FamilyAsyncNotifier<String, String> {
  @override
  FutureOr<String> build(String arg) async => await _getString();

  void setString(String s) => state = AsyncData(s);
  String getString() => state.value ?? 'Riverpod Latest';
}

Future<String> _getString() async => 'Riverpod Latest';
