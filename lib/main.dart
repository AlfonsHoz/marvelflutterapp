import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:pruebamarvel/characters/repository/characters_repository.dart';
import 'package:pruebamarvel/characters/viewmodel/characters_viewmodel.dart';
import 'package:pruebamarvel/core/app_routes.dart';
import 'package:pruebamarvel/core/services/services_locator.dart';

void main() async {
  await dotenv.load();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                CharactersViewModel(locator<CharactersRepositoryImpl>()))
      ],
      child: MaterialApp(
        title: '',
        theme: ThemeData(
          fontFamily: 'Roboto-Regular',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.homeRoute,
        routes: AppRoutes.routes(),
      ),
    );
  }
}
