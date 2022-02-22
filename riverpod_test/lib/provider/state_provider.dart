import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Object class demo
final countObject = StateProvider((ref) => ObjectClass(counter: 0, result: 0));

class ObjectClass {
  /// data type can be final
  /// data type be late
  final int counter;
  final int result;

  ObjectClass({
    required this.counter,
    required this.result,
  });

  ObjectClass copyWith({
    int? counter,
    int? result,
  }) {
    return ObjectClass(
      counter: counter ?? this.counter,
      result: result ?? this.result,
    );
  }
}
