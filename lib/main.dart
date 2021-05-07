import 'package:aircraftclosingroom/views/logIn/loginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//are you packaging on a development build?.. if so change to true ELSE false
bool _debugBuild = true;

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
    return MaterialApp(
      debugShowCheckedModeBanner: _debugBuild,
      home: LoginView(),
    );
  }
}
