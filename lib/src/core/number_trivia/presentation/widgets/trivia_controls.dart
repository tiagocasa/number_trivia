import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../mobx/number_trivia_store.dart';

class TriviaControls extends StatelessWidget {
  const TriviaControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final numberTriviaStore = Modular.get<NumberTriviaStore>();
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final controller = TextEditingController();
    const String hintText = 'Input a number';
    String? inputString;

    return Column(
      children: <Widget>[
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: hintText),
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
                ? 'Should be a valid number'
                : null;
          },
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: colorScheme.tertiaryContainer,
                  foregroundColor: colorScheme.onPrimaryContainer,
                ),
                onPressed: () async {
                  if (inputString == null) {
                    null;
                  } else if (int.tryParse(inputString!) != null) {
                    controller.clear();
                    await numberTriviaStore
                        .getConcreteNumberTrivia(inputString!);
                  } else {
                    null;
                  }
                },
                child: const Text('Search Trivia'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: colorScheme.primaryContainer,
                  foregroundColor: colorScheme.onPrimaryContainer,
                ),
                onPressed: () async {
                  if (inputString == null) {
                    null;
                  } else {
                    controller.clear();
                  }
                  await numberTriviaStore.getRandomNumberTrivia();
                },
                child: const Text('Random Trivia'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
