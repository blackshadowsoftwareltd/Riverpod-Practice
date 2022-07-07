import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(const ProviderScope(child: MaterialApp(home: Home())));
