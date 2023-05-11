import 'package:flutter/material.dart';
import '/bloc/bloc_imports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Code mit separatem BlocListener und BlocBuilder:
            // Container(
            //   child: Center(
            //     child: BlocListener<CounterBloc, CounterState>(
            //       // Der BlocListener benötigt einen Listener und ein Child.
            //
            //       listener: (context, state) {
            //         if (state is CounterIncrementState) {
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             const SnackBar(
            //               content: Text('One more!'),
            //               duration: Duration(milliseconds: 300),
            //             ),
            //           );
            //         } else if (state is CounterDecrementState) {
            //           ScaffoldMessenger.of(context).showSnackBar(
            //             const SnackBar(
            //               content: Text('One less!'),
            //               duration: Duration(milliseconds: 300),
            //             ),
            //           );
            //         }
            //       },
            //       child: BlocBuilder<CounterBloc, CounterState>(
            //           // Der BlocBuilder benötigt nur einen Builder, aber kein Child.
            //           builder: (context, state) {
            //         return Text(
            //           // Der BlocBuilder gibt uns den State, auf den wir jetzt
            //           // zugreifen können, um den CounterValue korrekt anzuzeigen:
            //           'Counter value: ${state.counterValue}',
            //           style: const TextStyle(
            //               fontSize: 20, fontWeight: FontWeight.bold),
            //         );
            //       }),
            //     ),
            //   ),
            // ),

            /// Code mit BlocConsumer:
            Container(
              child: Center(
                child: BlocConsumer<CounterBloc, CounterState>(
                    // Der BlocConsumer hat einfach beide Funktionen "listener" und "builder" und
                    // benötigt kein Child, sondern ein return-Statement.
                    listener: (context, state) {
                  if (state is CounterIncrementState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('One more!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  } else if (state is CounterDecrementState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('One less!'),
                        duration: Duration(milliseconds: 300),
                      ),
                    );
                  }
                }, builder: (context, state) {
                  return Text(
                    // Der BlocBuilder gibt uns den State, auf den wir jetzt
                    // zugreifen können, um den CounterValue korrekt anzuzeigen:
                    'Counter value: ${state.counterValue}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(CounterDecrementEvent());
                      },
                      icon: const Icon(Icons.remove),
                      label: const Text('Decrease'),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<CounterBloc>()
                            .add(CounterIncrementEvent());
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Increase'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
