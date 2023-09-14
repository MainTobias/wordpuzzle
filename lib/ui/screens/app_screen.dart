import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordpuzzle/ui/screens/shared_lists.dart';
import 'package:wordpuzzle/ui/screens/your_words.dart';

import '../ui_global.dart';
import 'study_screen.dart';

class AppScreen extends ConsumerStatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends ConsumerState<AppScreen> {
  @override
  Widget build(BuildContext context) {
    final index = ref.watch(tabIndexProvider);
    if (index == 0) {
      return const StudyScreen();
    } else if (index == 1) {
      return const YourWords();
    } else if (index == 2) {
      return const SharedLists();
    } else {
      throw 'Index invalid!';
    }
  }
}
