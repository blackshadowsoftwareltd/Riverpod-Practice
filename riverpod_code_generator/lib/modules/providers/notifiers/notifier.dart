import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifier.g.dart';

@Riverpod(keepAlive: true)
class Counter extends _$Counter {
  @override
  int build() => 0;

  void increment() => state++;
  void decrement() => state--;
}
