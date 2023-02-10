import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;

final provider = Provider<String>((ref) {
  return 'Do something'; // Provider is Immutable
});
