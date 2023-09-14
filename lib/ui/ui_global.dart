import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ui_global.g.dart';

@riverpod
class TabIndex extends _$TabIndex {
  @override
  int build() {
    return 0;
  }

  void setTab(int newTab) {
    state = newTab;
  }
}