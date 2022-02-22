import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverpod_test/provider/state_provider.dart';

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
