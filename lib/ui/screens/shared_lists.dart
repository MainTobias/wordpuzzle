import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/navbar.dart';

class SharedLists extends ConsumerWidget {
  const SharedLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Lists"),
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}
