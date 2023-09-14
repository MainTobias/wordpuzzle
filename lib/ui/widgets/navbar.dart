import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ui_global.dart';

class NavBar extends ConsumerWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(tabIndexProvider);
    return NavigationBar(
      selectedIndex: index,
      onDestinationSelected: (int index) {
        ref.read(tabIndexProvider.notifier).setTab(index);
      },
      destinations: const <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.school),
          label: "Study",
        ),
        NavigationDestination(
          icon: Icon(Icons.format_list_bulleted),
          label: "Your Words",
        ),
        NavigationDestination(
          icon: Icon(Icons.public),
          label: "Shared Lists",
        ),
      ],
    );
  }
}