import 'package:flutter/material.dart' show TextEditingController;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show
        AutoDisposeFamilyNotifier, 
        AutoDisposeNotifierProviderFamily;

final txtEdtCtrl = AutoDisposeNotifierProviderFamily(_Home.new);

class _Home extends AutoDisposeFamilyNotifier<TextEditingController, String> {
  @override
  TextEditingController build(String arg) => TextEditingController();

  void setText(String s) => state.text = s;
  void clear() => state.clear();
}
