import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Object class demo
// final countObject = StateProvider((ref) => ObjectClass(counter: 0, result: 0));

final tiles = StateProvider((ref) {
  late List<int> _tiles;
  _tiles = List.filled(9, 0);
  return _tiles;
});

final isAi = StateProvider((ref) => false);

final setStartWith =
    StateProvider.family<TicTacToeModel, bool>((ref, startWithAi) {
  final _tiles = ref.read(tiles);
  return TicTacToeModel(tiles: _tiles, startWithAi: startWithAi);
});

class TicTacToeModel {
  final List<int> tiles;
  final bool startWithAi;

  TicTacToeModel({required this.tiles, required this.startWithAi});

  TicTacToeModel copyWith({
    List<int>? tiles,
    bool? startWithAi,
  }) {
    return TicTacToeModel(
      tiles: tiles ?? this.tiles,
      startWithAi: startWithAi ?? this.startWithAi,
    );
  }
}
