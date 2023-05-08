import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:number_trivia/src/core/number_trivia/presentation/mobx/number_trivia_store.dart';

import '../widgets/custom_drawer.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});
  // MobX

  @override
  Widget build(BuildContext context) {
    //final text = context.watch<NumberTriviaStore>((store) => store.triviaText);
    final numberTriviaStore = Modular.get<NumberTriviaStore>();
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Number Trivia'),
        ),
        body: Observer(
          builder: (_) => ModalProgressHUD(
            inAsyncCall: numberTriviaStore.isLoading,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          AutoSizeText(
                            numberTriviaStore.triviaNumber == 0
                                ? ''
                                : numberTriviaStore.triviaNumber.toString(),
                            style: const TextStyle(fontSize: 80),
                            maxLines: 1,
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
    String? inputString;
    final controller = TextEditingController();
    return Column(
      children: <Widget>[
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: 'Input a number'),
          onChanged: (value) {
            inputString = value;
          },
          onFieldSubmitted: (_) async {
            if (int.tryParse(inputString!) != null) {
              controller.clear();
              await numberTriviaStore.getConcreteNumberTrivia(inputString!);
            } else {
              null;
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (
            String? value,
          ) {
            return int.tryParse(value!) == null
                ? 'Shoulb be a valid number'
                : null;
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.tertiaryContainer,
                    foregroundColor:
                        Theme.of(context).colorScheme.onPrimaryContainer),
                onPressed: () async {
                  if (int.tryParse(inputString!) != null) {
                    controller.clear();
                    await numberTriviaStore
                        .getConcreteNumberTrivia(inputString!);
                  } else {
                    null;
                  }
                },
                child: const Text('Search'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
                child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  foregroundColor:
                      Theme.of(context).colorScheme.onPrimaryContainer),
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
