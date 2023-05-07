import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:number_trivia/src/core/number_trivia/presentation/mobx/number_trivia_store.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});
  // MobX

  @override
  Widget build(BuildContext context) {
    //final text = context.watch<NumberTriviaStore>((store) => store.triviaText);
    final numberTriviaStore = Modular.get<NumberTriviaStore>();
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Number Trivia')),
        ),
        body: Observer(
          builder: (_) => ModalProgressHUD(
            inAsyncCall: numberTriviaStore.isLoading,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          Text(
                            numberTriviaStore.triviaNumber == 0
                                ? ''
                                : numberTriviaStore.triviaNumber.toString(),
                            style: const TextStyle(fontSize: 80),
                          ),
                          Expanded(
                            child: Center(
                              child: SingleChildScrollView(
                                child: Text(
                                  numberTriviaStore.triviaText,
                                  style: const TextStyle(fontSize: 25),
                                  textAlign: TextAlign.center,
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
    final controller = TextEditingController();
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Input a number'),
          onChanged: (value) {
            inputString = value;
          },
          onSubmitted: (_) async {
            controller.clear();
            await numberTriviaStore.getConcreteNumberTrivia(inputString);
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
                  controller.clear();
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
                controller.clear();
                await numberTriviaStore.getRandomNumberTrivia();
              },
              child: const Text('Get Random Trivia'),
            )),
          ],
        )
      ],
    );
  }
}
