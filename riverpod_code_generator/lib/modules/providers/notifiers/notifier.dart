import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifier.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;

  increment() => state++;
  decrement() => state--;
}
