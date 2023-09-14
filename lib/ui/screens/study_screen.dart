import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';
import 'package:wordpuzzle/models/shared_prefs_service.dart';
import 'package:wordpuzzle/models/shuffle.dart';
import 'package:wordpuzzle/ui/widgets/answer_field.dart';

import '../widgets/navbar.dart';

class StudyScreen extends ConsumerStatefulWidget {
  const StudyScreen({super.key});

  @override
  ConsumerState<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends ConsumerState<StudyScreen> {
  final Random r = Random();
  String? word;
  String? shuffledWord;

  @override
  Widget build(BuildContext context) {
    if (word == null) {
      nextWord();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Study"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 100.0, horizontal: 8.0),
            child: Center(
              child: Text(
                shuffledWord!,
                style: Theme.of(context).textTheme.displaySmall!,
              ),
            ),
          ),
          AnswerField(
            length: word!.length + 5,
          )
        ],
      ),
      bottomNavigationBar: const NavBar(),
    );
  }

  void nextWord() {
    final words = ref.read(yourWordsProvider);
    word = words[r.nextInt(words.length)].toLowerCase();
    shuffledWord = word!.shuffled;
  }
}
