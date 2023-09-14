import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordpuzzle/models/shared_prefs_service.dart';
import 'package:wordpuzzle/ui/router/router.dart';
import 'firebase_options.dart';

class Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final fire = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sp = SharedPrefsService.init();

  await Future.wait([fire, sp]);

  runApp(
    ProviderScope(
      observers: [
        if (kDebugMode) Logger(),
      ],
      child: const BaseAppRouter(),
    ),
  );
}

class BaseAppRouter extends ConsumerWidget {
  const BaseAppRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      title: "Wordpuzzle",
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(useMaterial3: true),
    );
  }
}
