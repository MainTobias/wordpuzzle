extension Shuffle on String {
  String get shuffled => String.fromCharCodes(runes.toList()..shuffle());
}
