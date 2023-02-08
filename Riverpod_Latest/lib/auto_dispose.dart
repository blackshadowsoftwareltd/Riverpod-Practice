import 'package:flutter_riverpod/flutter_riverpod.dart'
    show AutoDisposeNotifierProvider, AutoDisposeNotifier;

final homeProvider = AutoDisposeNotifierProvider<_Home, String?>(_Home.new);

class _Home extends AutoDisposeNotifier<String?> {
  @override
  build() => null;

  void setString(String s) => state = s;
  void setNull() => state = null;
}
