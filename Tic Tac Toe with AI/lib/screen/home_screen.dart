import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/provider/state_provider.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer(builder: (_, ref, __) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Switch(
                        value: ref.watch(isAi),
                        onChanged: (value) {
                          final _data = ref.read(isAi.state);
                          _data.state = value;
                        }),
                    const SizedBox(width: 10),
                    Text(
                        ref.watch(isAi) ? 'Started with AI' : 'Started with me',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))
                  ]);
            }),
            SizedBox(
              width: 300,
              height: 300,
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.builder(
                    itemCount: widgetRef.read(tiles.state).state.tiles.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final _data = widgetRef.watch(tiles.state).state;
                      return Padding(
                        padding: const EdgeInsets.all(5),
                        child: Consumer(
                          builder: (_, _aiRef, __) => OutlinedButton(
                            onPressed: widgetRef
                                        .read(tiles.state)
                                        .state
                                        .tiles[index] ==
                                    0
                                ? () {
                                    final _tileRef =
                                        widgetRef.read(tiles.state);
                                    List<int> _list = _tileRef.state.tiles;
                                    _list[index] = 1;
                                    _tileRef.state =
                                        _tileRef.state.copyWith(tiles: _list);

                                    runAi(ref: _aiRef);
                                  }
                                : null,
                            style: OutlinedButton.styleFrom(
                                primary: Colors.black,
                                backgroundColor: Colors.white,
                                elevation: 5,
                                padding: EdgeInsets.zero,
                                shadowColor: Colors.black26,
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Consumer(
                              builder: (_, ref, __) {
                                final _data = ref.watch(
                                    tiles.select((value) => value.tiles));

                                return Text(_data[index] == 0
                                    ? ''
                                    : ref.watch(tiles.select((value) =>
                                                value.tiles))[index] ==
                                            1
                                        ? 'X'
                                        : 'O');
                              },
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Text(
                isWin(1, widgetRef.watch(tiles.select((value) => value.tiles)))
                    ? 'You won!'
                    : isWin(
                            2,
                            widgetRef
                                .watch(tiles.select((value) => value.tiles)))
                        ? 'You lost!'
                        : 'Your move',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            OutlinedButton(
                onPressed: () {
                  final _ref = widgetRef.read(tiles.state);
                  _ref.state =
                      TicTacList(tiles: List.generate(9, (index) => 0));
                },
                child: const Text('Restart'))
          ],
        ),
      ),
    );
  }

  void runAi({required WidgetRef ref}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final _aiRef = ref.read(tiles.state);
    int? winning;
    int? blocking;
    int? normal;
    for (int i = 0; i < 9; i++) {
      int val = _aiRef.state.tiles[i];
      if (val > 0) {
        continue;
      }
      List<int> future = [..._aiRef.state.tiles]..[i] = 2;
      if (isWin(2, future)) {
        winning = i;
      }
      future[i] = 1;
      if (isWin(1, future)) {
        blocking = i;
      }
      normal = i;
    }
    final move = winning ?? blocking ?? normal;
    if (move != null) {
      final _listRef = ref.read(tiles.state);
      List<int> _newList = _listRef.state.tiles;
      _newList[move] = 2;
      _listRef.state = _listRef.state.copyWith(tiles: _newList);
    }
  }
}
