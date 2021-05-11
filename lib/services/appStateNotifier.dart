import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppStateNotifier extends ChangeNotifier {
  bool isDarkMode = false;
  static final appStateNotifier = ChangeNotifierProvider<AppStateNotifier>((ref) => AppStateNotifier());
}
