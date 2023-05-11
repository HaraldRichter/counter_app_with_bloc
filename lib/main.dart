import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:udemy_bloc_counter_project/screens/home.dart';
import '/bloc/bloc_imports.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Hydrated Bloc speichert die States, wenn die App geschlossen oder neu gestartet wird.
// Allerdings spackt das path_provider-package wegen Web rum, weswegen wir hier den Hydrated Bloc nicht nutzen.
  // HydratedBloc.storage =
  //     await HydratedStorage.build(storageDirectory: Directory(r"\storage"));

  Bloc.observer = CounterBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterBloc(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
