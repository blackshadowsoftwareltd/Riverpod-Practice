import 'package:flutter/material.dart' show TextEditingController;
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show FamilyNotifier, NotifierProviderFamily;

///*  final nameCtrl = ref.watch(textControllerProvider('name'));
///
final textControllerProvider =
    NotifierProviderFamily<_TextController, TextEditingController, String>(
        _TextController.new);

class _TextController extends FamilyNotifier<TextEditingController, String> {
  @override
  TextEditingController build(String arg) => TextEditingController();

  void setText(String s) => state.text = s;
  void clear() => state.clear();
}
