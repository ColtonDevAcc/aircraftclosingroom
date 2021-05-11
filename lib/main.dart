import 'package:aircraftclosingroom/services/appStateNotifier.dart';
import 'package:aircraftclosingroom/views/logIn/loginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//are you packaging on a development build?.. if so change to true ELSE false
final appStateProvider = ChangeNotifierProvider((ref) => AppStateNotifier());

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final ThemeData theme = watch(appStateProvider).getTheme;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
      theme: theme,
    );
  }
}
