import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(
      /// ProviderScope came from flutter_riverpod.
      /// It must be declared in the root
      const ProviderScope(
        child: MaterialApp(
            // home: CounterDemo(),
            // home: CounterWithObjectClass(),
            ),
      ),
    );
