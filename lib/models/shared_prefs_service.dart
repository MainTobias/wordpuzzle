import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_prefs_service.g.dart';

class SharedPrefsService {
  SharedPrefsService._();

  static late final SharedPrefsService _instance;
  static bool _isInitialized = false;

  late final SharedPreferences sharedPreferences;

  static Future<SharedPrefsService> init() async {
    if (!_isInitialized) {
      _instance = SharedPrefsService._();
      _instance.sharedPreferences = await SharedPreferences.getInstance();

      _isInitialized = true;
    }
    return _instance;
  }

  static SharedPrefsService get instance {
    if (!_isInitialized) {
      throw 'SharedPrefsService has not been initialized';
    }
    return _instance;
  }
}

@riverpod
class YourWords extends _$YourWords {
  static const _key = "your_words";

  @override
  List<String> build() =>
      SharedPrefsService.instance.sharedPreferences.getStringList(_key) ?? [];

  Future<bool> add(String word) async {
    if (state.contains(word)) return false;
    state = [...state, word];
    return await SharedPrefsService.instance.sharedPreferences
        .setStringList(_key, state);
  }

  Future<bool> remove(String word) async {
    if (!state.contains(word)) return false;
    state = state.where((x) => x != word).toList();
    return await SharedPrefsService.instance.sharedPreferences
        .setStringList(_key, state);
  }
}
