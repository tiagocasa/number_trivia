import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:number_trivia/src/core/number_trivia/presentation/mobx/number_trivia_store.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});
  // MobX

  @override
  Widget build(BuildContext context) {
    final text = context.watch<NumberTriviaStore>((store) => store.triviaText);
    final numberTriviaStore = Modular.get<NumberTriviaStore>();
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Number Trivia')),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    children: [
                      Observer(
                        builder: (_) => Text(
                          numberTriviaStore.triviaNumber.toString(),
                          style: const TextStyle(fontSize: 80),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Observer(
                            builder: (_) => SingleChildScrollView(
                              child: Text(
                                text.triviaText,
                                style: const TextStyle(fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const TriviaControls()
              ],
            ),
          ),
        ));
  }
}

class TriviaControls extends StatelessWidget {
  const TriviaControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final numberTriviaStore = Modular.get<NumberTriviaStore>();
    var inputString = '';
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Input a number'),
          onChanged: (value) {
            inputString = value;
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                onPressed: () async {
                  await numberTriviaStore.getConcreteNumberTrivia(inputString);
                },
                child: const Text('Search'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () async {
                await numberTriviaStore.getRandomNumberTrivia();
                print('donte');
                print(numberTriviaStore.triviaText);
              },
              child: const Text('Get Random Trivia'),
            )),
          ],
        )
      ],
    );
  }
}
