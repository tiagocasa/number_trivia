import 'package:flutter/material.dart';

import '../../core/number_trivia/presentation/mobx/number_trivia_store.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.inputString,
      required this.controller,
      required this.numberTriviaStore,
      required this.labelText,
      required this.backgroundColor,
      required this.foregroundColor});

  final String? inputString;
  final TextEditingController controller;
  final NumberTriviaStore numberTriviaStore;
  final String labelText;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
      ),
      onPressed: () async {
        if (int.tryParse(inputString!) != null) {
          controller.clear();
          await numberTriviaStore.getConcreteNumberTrivia(inputString!);
        } else {
          null;
        }
      },
      child: Text(labelText),
    );
  }
}
