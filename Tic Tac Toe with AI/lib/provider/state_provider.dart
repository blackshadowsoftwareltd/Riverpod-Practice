import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAi = StateProvider((ref) => false);

final tiles = StateProvider<TicTacList>((ref) {
  final _list = List.generate(9, (index) => 0);

  return TicTacList(tiles: _list);
});

final isWinning = StateProvider.family((ref, bool? value) => value ?? false);

bool isWin(int who, List<int> tiles) {
  late bool _data;

  _data = (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
      (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
      (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
      (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
      (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
      (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
      (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
      (tiles[2] == who && tiles[5] == who && tiles[8] == who);

  isWinning(_data);

  return _data;
}

final setStartWith =
    StateProvider.family<TicTacToeModel, bool>((ref, startWithAi) {
  final _tiles = ref.read(tiles).tiles;
  return TicTacToeModel(tiles: _tiles, startWithAi: startWithAi);
});

class TicTacList {
  final List<int> tiles;

  TicTacList({required this.tiles});

  TicTacList copyWith({
    List<int>? tiles,
  }) {
    return TicTacList(
      tiles: tiles ?? this.tiles,
    );
  }
}

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

class WhoWinnList {
  final int who;
  final List<int> tiles;
  WhoWinnList({required this.who, required this.tiles});
}
