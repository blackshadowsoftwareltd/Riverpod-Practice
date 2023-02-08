import 'dart:async' show FutureOr;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show
        AsyncData,
        AutoDisposeAsyncNotifierProviderFamily,
        AutoDisposeFamilyAsyncNotifier;

final homeProvider =
    AutoDisposeAsyncNotifierProviderFamily<_Home, String, String>(_Home.new);

class _Home extends AutoDisposeFamilyAsyncNotifier<String, String> {
  @override
  FutureOr<String> build(String arg) => _getString();

  void setString(String s) => AsyncData(s);
  Future<String> getString() async => state.value ?? 'Riverpod Latest';
}

Future<String> _getString() async => 'Riverpod Latest';
