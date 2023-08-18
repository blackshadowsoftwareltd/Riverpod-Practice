import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'futures.g.dart';

@riverpod
Future<String> getName(GetNameRef ref, {required int id}) async {
  return await _getName(id);
}

Future<String> _getName(int id) async {
  await Future.delayed(const Duration(seconds: 3));
  return Future.value('$id. Remon Ahammad');
}
