import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }

  void removeItem(WordPair value) {
    if (favorites.contains(value)) {
      favorites.remove(value);
      notifyListeners();
    }
  }
  ThemeMode _themeMode = ThemeMode.light; // По умолчанию светлая тема

  ThemeMode get themeMode => _themeMode;

  // Переключаем тему

  void toggleTheme() {
    if (_themeMode == ThemeMode.light) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }

    notifyListeners(); // Уведомить всех слушателей о том, что состояние изменилось
  }
}
