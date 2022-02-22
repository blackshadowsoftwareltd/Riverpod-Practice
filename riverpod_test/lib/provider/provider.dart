import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/provider/state_provider.dart';

/// data type must be final

/// Provider demo
/// The provider will cache all data.
/// The Provider will read data for the first time. It will read again when the data will be changed.
/// Otherwise, it will not read for the second time.

//---------------------------------------------------------------

/// 1 st Simple way
// final providerData = Provider<Map<String, Object>>((ref) {
//  /// This provider will reload when the counterObject provider will be reloaded.
//   final _counter = ref.watch(countObject);
//   final _data = {
//     "postId": _counter.counter, // It will reflect on the data
//     "id": 'djklsfa f lasd las ',
//     "name": "odio adipisci rerum aut animi",
//     "email": "Nikita@garfield.biz",
//     "body":
//         "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione"
//   };
//   return _data;
// });

//---------------------------------------------------------------

// /// 2nd. Complex way. This method will put data when it will be initialized.
// final providerData = Provider.family<Map<String, Object>, String>
//     // That means this method will return a Map<String,Object>. which is _data type. and It will receive a title or text something.
//     ((ref, title) {
//   /// This provider will reload when the counterObject provider will be reloaded.
//   final _counter = ref.watch(countObject);
//   final _data = {
//     "postId": _counter.counter, // It will reflect on the data
//     "id": title,
//     "name": "odio adipisci rerum aut animi",
//     "email": "Nikita@garfield.biz",
//     "body":
//         "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione"
//   };
//   return _data;
// });

/// 3nd. autoDispose will dispose of all cached data when this context will be dismissed.
final providerDatazzz = Provider.autoDispose<String>((ref) {
  return '';
});
