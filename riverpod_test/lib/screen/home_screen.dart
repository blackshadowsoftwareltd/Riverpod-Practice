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
                        child: OutlinedButton(
                          onPressed: widgetRef
                                      .read(tiles.state)
                                      .state
                                      .tiles[index] ==
                                  0
                              ? () {
                                  final _tileRef = widgetRef.read(tiles.state);
                                  List<int> _list = _tileRef.state.tiles;
                                  _list[index] = 1;
                                  _tileRef.state =
                                      _tileRef.state.copyWith(tiles: _list);
                                  // List<int> _list =
                                  //     widgetRef.read(tiles.state).state;
                                  // _list[i] = 1;
                                  // widgetRef.read(tiles.state).state = _list;

                                  // runAi();
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
                              final _data = ref
                                  .watch(tiles.select((value) => value.tiles));

                              return Text(_data[index] == 0
                                  ? ''
                                  : ref.watch(tiles.select(
                                              (value) => value.tiles))[index] ==
                                          1
                                      ? 'X'
                                      : 'O');
                            },
                          ),
                        ),
                      );
                    }),
              ),
            ),
            // Text(
            //     isWin(1, tiles)
            //         ? 'You won!'
            //         : isWin(2, tiles)
            //             ? 'You lost!'
            //             : 'Your move',
            //     style:
            //         const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            // OutlinedButton(
            //     onPressed: () {
            //       widgetRef.read(tiles(null));
            //     },
            //     child: const Text('Restart'))
          ],
        ),
      ),
    );
  }

  // void runAi() async {
  //   await Future.delayed(const Duration(milliseconds: 500));
  //   int? winning;
  //   int? blocking;
  //   int? normal;
  //   for (int i = 0; i < 9; i++) {
  //     int val = tiles[i];
  //     if (val > 0) {
  //       continue;
  //     }
  //     List<int> future = [...tiles]..[i] = 2;
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
  //     tiles[move] = 2;
  //     // setState(() {});
  //   }
  // }
}

// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef widgetRef) {
//     widgetRef.read(setStartWith(false));
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Center(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Consumer(builder: (_, ref, __) {
//                     return Switch(
//                         value: ref.watch(isAi),
//                         onChanged: (value) {
//                           final _data = ref.read(isAi.state);
//                           _data.state = value;
//                         });
//                   }),
//                   const SizedBox(width: 10),
//                   Text(
//                     widgetRef.watch(isAi)
//                         ? 'Started with AI'
//                         : 'Started with me',
//                     style: const TextStyle(
//                         fontSize: 20, fontWeight: FontWeight.bold),
//                   )
//                 ],
//               ),
//               SizedBox(
//                 width: 300,
//                 height: 300,
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: GridView.builder(
//                       itemCount: widgetRef.read(tiles.state).state.length,
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 3),
//                       itemBuilder: (context, i) {
//                         return Padding(
//                           padding: const EdgeInsets.all(5),
//                           child: OutlinedButton(
//                             /// onPressed
//                             onPressed: () {
//                               widgetRef.read(onPressed(i));
//                             },

//                             ///
//                             child:
//                                 Text(widgetRef.watch(tiles.state).state[i] == 0
//                                     ? ''
//                                     : widgetRef.watch(tiles.state).state[i] == 1
//                                         ? 'X'
//                                         : 'O'),
//                             style: OutlinedButton.styleFrom(
//                               primary: Colors.black,
//                               backgroundColor: Colors.white,
//                               elevation: 5,
//                               padding: EdgeInsets.zero,
//                               shadowColor: Colors.black26,
//                               textStyle: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 30),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                   // child: GridView.count(crossAxisCount: 3, children: [
//                   //   ///
//                   //   for (int i = 0; i < 9; i++)
//                   //     Padding(
//                   //       padding: const EdgeInsets.all(5),
//                   //       child: OutlinedButton(
//                   //         /// onPressed
//                   //         onPressed: () {
//                   //           widgetRef.read(onPressed(i));
//                   //         },

//                   //         ///
//                   //         child: Text(widgetRef.watch(tiles.state).state[i] == 0
//                   //             ? ''
//                   //             : widgetRef.watch(tiles.state).state[i] == 1
//                   //                 ? 'X'
//                   //                 : 'O'),
//                   //         style: OutlinedButton.styleFrom(
//                   //           primary: Colors.black,
//                   //           backgroundColor: Colors.white,
//                   //           elevation: 5,
//                   //           padding: EdgeInsets.zero,
//                   //           shadowColor: Colors.black26,
//                   //           textStyle: const TextStyle(
//                   //               fontWeight: FontWeight.bold, fontSize: 30),
//                   //           shape: RoundedRectangleBorder(
//                   //             borderRadius: BorderRadius.circular(10),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     )
//                   // ]),
//                 ),
//               ),

//               ///
//               Text(
//                   // blocState.isWinning(1, state.tiles)
//                   //     ? 'You won!'
//                   //     : blocState.isWinning(2, state.tiles)
//                   //         ? 'You lost!'
//                   //         : 'Your move',
//                   'win',
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 30)),

//               /// Restart
//               OutlinedButton(
//                   // onPressed: () => bloc.resetTiles(),
//                   onPressed: () {},
//                   child: const Text('Restart', style: TextStyle(fontSize: 30)))
//             ])));
//   }
// }
