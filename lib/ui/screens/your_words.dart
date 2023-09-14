import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordpuzzle/models/shared_prefs_service.dart';

import '../widgets/navbar.dart';

class YourWords extends ConsumerWidget {
  const YourWords({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final words = ref.watch(yourWordsProvider);
    log(words.toString());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your words"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          if (index < words.length) {
            return ListTile(title: Text(words[index]));
          }
        },
      ),
      bottomNavigationBar: const NavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final formKey = GlobalKey<FormState>();
          late String word;

          final w = await showDialog<String>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => AlertDialog(
              title: const Text("Add new word"),
              content: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "New word",
                        ),
                        validator: (String? val) {
                          if (val == null || val.isEmpty) {
                            return "Can't be empty";
                          }
                          return null;
                        },
                        onSaved: (String? val) {
                          word = val!;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: Theme.of(context).textTheme.labelLarge,
                  ),
                  child: const Text('Add'),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      Navigator.of(context).pop(word);
                    }
                  },
                ),
              ],
            ),
          );
          if (w != null) ref.read(yourWordsProvider.notifier).add(w);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
