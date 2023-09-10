import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rickandmorty/ui/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          displayMedium: TextStyle(fontSize: 24, color: Colors.white),
          displaySmall: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w200, color: Colors.white),
          bodyLarge: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          bodySmall: TextStyle(
              fontSize: 11, fontWeight: FontWeight.w100, color: Colors.grey),
        ),
      ),
      home: HomePage(title: 'Rick and Morty'),
    );
  }
}
