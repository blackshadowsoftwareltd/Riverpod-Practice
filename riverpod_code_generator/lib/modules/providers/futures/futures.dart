import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../notifiers/notifier.dart';
part 'futures.g.dart';

@Riverpod(keepAlive: true)
Future<String> getName(GetNameRef ref, {required int id}) async {
  return await _getName(id);
}

Future<String> _getName(int id) async {
  await Future.delayed(const Duration(seconds: 2));
  return Future.value('$id. Remon Ahammad');
}

@Riverpod(keepAlive: true)
class GetFutureName extends _$GetFutureName {
  final data = 'Remon Ahammad';
  @override
  Future<String> build() async {
    await Future.delayed(const Duration(seconds: 2));
    return await Future.value(data);
  }

  void updateId() =>
      state = AsyncValue.data('${ref.read(counterProvider)}. $data');
}
