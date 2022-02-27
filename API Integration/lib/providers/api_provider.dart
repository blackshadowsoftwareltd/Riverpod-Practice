import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../apis/api.dart';
import '../models/model.dart';

final gamerList =
    FutureProvider<List<GamerModel>?>((ref) => GammerApi.getGamerData());
