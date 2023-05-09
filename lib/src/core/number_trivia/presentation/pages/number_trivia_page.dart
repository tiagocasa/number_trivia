import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:number_trivia/src/core/number_trivia/presentation/mobx/number_trivia_store.dart';
import 'package:intl/intl.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/trivia_controls.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat('###,###');

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
                                : formatter
                                    .format(numberTriviaStore.triviaNumber)
                                    .toString(),
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
