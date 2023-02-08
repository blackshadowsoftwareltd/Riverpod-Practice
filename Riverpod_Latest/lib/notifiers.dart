import 'package:flutter_riverpod/flutter_riverpod.dart'
    show NotifierProvider, Notifier;

final homeProvider = NotifierProvider<_Home, String>(_Home.new);

class _Home extends Notifier<String> {
  @override
  String build() => 'Riverpod Latest';

  void setString(String s) => state = s;

  Future<String> getString() async => 'Riverpod Latest';
}
