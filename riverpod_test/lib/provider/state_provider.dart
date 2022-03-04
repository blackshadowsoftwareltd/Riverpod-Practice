import 'package:flutter_riverpod/flutter_riverpod.dart';

final isAi = StateProvider((ref) => false);

final tiles = StateProvider((ref) {
  final _list = List.generate(9, (index) => 0);
  print('_list $_list');
  return _list;
});

final isWinning = StateProvider.family((ref, bool? value) => value ?? false);

bool isWin(int who, List<int> tiles) {
  late bool _data;
  final letsWin = StateProvider((ref) {
    _data = (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
        (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
        (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
        (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
        (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
        (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
        (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
        (tiles[2] == who && tiles[5] == who && tiles[8] == who);

    ref.read(isWinning(_data));
  });
  return _data;
}

final setStartWith =
    StateProvider.family<TicTacToeModel, bool>((ref, startWithAi) {
  final _tiles = ref.read(tiles);
  return TicTacToeModel(tiles: _tiles, startWithAi: startWithAi);
});

// final onPressed = StateProvider.family<void, int>((ref, index) async {
//   final _tiles = ref.read(tiles);
//   final _isAi = ref.read(isAi);

//   if (_tiles[index] == 0 && !isWinning(1, _tiles) && !isWinning(2, _tiles)) {
//     print('................1');
//     ref.read(tiles.state).state[index] = 1;

//     TicTacToeModel(tiles: ref.read(tiles.state).state, startWithAi: _isAi);
//     ref.read(setStartWith(_isAi));
//     if (!isWinning(1, _tiles) && !isWinning(2, _tiles)) {
//       ref.read(runAi);
//     }
//   }
// });

// final resetTiles = StateProvider((ref) async {
//   final _isAi = ref.read(isAi);
//   TicTacToeModel(tiles: List.filled(9, 0), startWithAi: _isAi);

//   if (_isAi == true) {
//     await Future.delayed(const Duration(milliseconds: 500));
//     ref.read(runAi);
//   }
// });

// final runAi = StateProvider((ref) async {
//   final _tiles = ref.read(tiles);
//   final _isAi = ref.read(isAi);
//   await Future.delayed(const Duration(milliseconds: 500));
//   int? winning, blocking, normal;
//   for (int i = 0; i < 9; i++) {
//     int val = _tiles[i];
//     if (val > 0) {
//       continue;
//     }
//     List<int> future = [..._tiles]..[i] = 2;
//     if (isWinning(2, future)) {
//       winning = i;
//     }
//     future[i] = 1;
//     if (isWinning(1, future)) {
//       blocking = i;
//     }
//     normal = i;
//   }
//   final move = winning ?? blocking ?? normal;
//   if (move != null) {
//     _tiles[move] = 2;
//   }
//   TicTacToeModel(tiles: _tiles, startWithAi: _isAi);
// });

// bool isWinning(int who, List<int> tiles) {
//   return (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
//       (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
//       (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
//       (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
//       (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
//       (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
//       (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
//       (tiles[2] == who && tiles[5] == who && tiles[8] == who);
// }

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
