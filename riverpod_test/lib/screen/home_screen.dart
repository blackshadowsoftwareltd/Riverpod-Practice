import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/provider/state_provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<int> tiles = List.filled(9, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: AspectRatio(
                aspectRatio: 1,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    for (int i = 0; i < 9; i++)
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: OutlinedButton(
                          onPressed: (tiles[i] == 0)
                              ? () {
                                  tiles[i] = 1;
                                  runAi();

                                  setState(() {});
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
                          child: Text(tiles[i] == 0
                              ? ''
                              : tiles[i] == 1
                                  ? 'X'
                                  : 'O'),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Text(
                isWinning(1, tiles)
                    ? 'You won!'
                    : isWinning(2, tiles)
                        ? 'You lost!'
                        : 'Your move',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            OutlinedButton(
                onPressed: () {
                  tiles = List.filled(9, 0);
                  setState(() {});
                },
                child: const Text('Restart'))
          ],
        ),
      ),
    );
  }

  void runAi() async {
    await Future.delayed(const Duration(milliseconds: 500));
    int? winning;
    int? blocking;
    int? normal;
    for (int i = 0; i < 9; i++) {
      int val = tiles[i];
      if (val > 0) {
        continue;
      }
      List<int> future = [...tiles]..[i] = 2;
      if (isWinning(2, future)) {
        winning = i;
      }
      future[i] = 1;
      if (isWinning(1, future)) {
        blocking = i;
      }
      normal = i;
    }
    final move = winning ?? blocking ?? normal;
    if (move != null) {
      tiles[move] = 2;
      setState(() {});
    }
  }

  bool isWinning(int who, List<int> tiles) {
    return (tiles[0] == who && tiles[1] == who && tiles[2] == who) ||
        (tiles[3] == who && tiles[4] == who && tiles[5] == who) ||
        (tiles[6] == who && tiles[7] == who && tiles[8] == who) ||
        (tiles[0] == who && tiles[4] == who && tiles[8] == who) ||
        (tiles[2] == who && tiles[4] == who && tiles[6] == who) ||
        (tiles[0] == who && tiles[3] == who && tiles[6] == who) ||
        (tiles[1] == who && tiles[4] == who && tiles[7] == who) ||
        (tiles[2] == who && tiles[5] == who && tiles[8] == who);
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef widgetRef) {
    widgetRef.read(setStartWith(false));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer(builder: (_, ref, __) {
                    return Switch(
                        value: ref.watch(isAi),
                        onChanged: (value) {
                          final _data = ref.read(isAi.state);
                          _data.state = value;
                        });
                  }),
                  const SizedBox(width: 10),
                  Text(
                    widgetRef.watch(isAi)
                        ? 'Started with AI'
                        : 'Started with me',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                width: 300,
                height: 300,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: GridView.builder(
                      itemCount: widgetRef.read(tiles.state).state.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: OutlinedButton(
                            /// onPressed
                            onPressed: () {
                              widgetRef.read(onPressed(i));
                            },

                            ///
                            child:
                                Text(widgetRef.watch(tiles.state).state[i] == 0
                                    ? ''
                                    : widgetRef.watch(tiles.state).state[i] == 1
                                        ? 'X'
                                        : 'O'),
                            style: OutlinedButton.styleFrom(
                              primary: Colors.black,
                              backgroundColor: Colors.white,
                              elevation: 5,
                              padding: EdgeInsets.zero,
                              shadowColor: Colors.black26,
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        );
                      }),
                  // child: GridView.count(crossAxisCount: 3, children: [
                  //   ///
                  //   for (int i = 0; i < 9; i++)
                  //     Padding(
                  //       padding: const EdgeInsets.all(5),
                  //       child: OutlinedButton(
                  //         /// onPressed
                  //         onPressed: () {
                  //           widgetRef.read(onPressed(i));
                  //         },

                  //         ///
                  //         child: Text(widgetRef.watch(tiles.state).state[i] == 0
                  //             ? ''
                  //             : widgetRef.watch(tiles.state).state[i] == 1
                  //                 ? 'X'
                  //                 : 'O'),
                  //         style: OutlinedButton.styleFrom(
                  //           primary: Colors.black,
                  //           backgroundColor: Colors.white,
                  //           elevation: 5,
                  //           padding: EdgeInsets.zero,
                  //           shadowColor: Colors.black26,
                  //           textStyle: const TextStyle(
                  //               fontWeight: FontWeight.bold, fontSize: 30),
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(10),
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  // ]),
                ),
              ),

              ///
              Text(
                  // blocState.isWinning(1, state.tiles)
                  //     ? 'You won!'
                  //     : blocState.isWinning(2, state.tiles)
                  //         ? 'You lost!'
                  //         : 'Your move',
                  'win',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30)),

              /// Restart
              OutlinedButton(
                  // onPressed: () => bloc.resetTiles(),
                  onPressed: () {},
                  child: const Text('Restart', style: TextStyle(fontSize: 30)))
            ])));
  }
}
