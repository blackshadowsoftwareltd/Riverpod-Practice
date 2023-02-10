import 'package:flutter_riverpod/flutter_riverpod.dart' show StreamProvider;

final customerProfileStreamProvider = StreamProvider(
    (ref) => isarDB.profileDB.watchObject(0, fireImmediately: true));
