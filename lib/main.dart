import 'package:flutter/material.dart';
import 'package:my_work/providers/exercise_provider.dart';

import './screens/exercise_management_screen.dart';
import 'package:provider/provider.dart';
import './screens/exercise_screen.dart';
import './screens/home_screen.dart';
import './screens/workout_management_screen.dart';
import './screens/workout_screen.dart';

//Providers
import './providers/workout_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => WorkoutProvider()),
        ChangeNotifierProvider(create: (_) => ExerciseProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(29, 34, 37, 0.9),
          ),
          canvasColor: Colors.transparent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cardColor: const Color.fromRGBO(60, 70, 72, 0.9),
          scaffoldBackgroundColor: const Color.fromRGBO(29, 34, 37, 0.9),
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline4: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            bodyText1: TextStyle(
              color: Colors.white,
            ),
            subtitle1: TextStyle(color: Colors.white),
            subtitle2: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(151, 152, 152, 1),
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: const Color.fromRGBO(0, 223, 100, 1),
            textTheme: ButtonTextTheme.primary,
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: const Color.fromRGBO(0, 223, 100, 1),
                ),
          ),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color.fromRGBO(0, 223, 100, 1),
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color.fromRGBO(0, 223, 100, 1),
            selectionHandleColor: Color.fromRGBO(0, 223, 100, 1),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            fillColor: Color.fromRGBO(48, 56, 62, 0.9),
            filled: true,
            border: InputBorder.none,
            labelStyle: TextStyle(
              color: Color.fromRGBO(151, 152, 152, 1),
            ),
          ),
        ),
        //home: const HomeScreen(),
        routes: {
          HomeScreen.route: (_) => const HomeScreen(),
          WorkoutScreen.route: (_) => const WorkoutScreen(),
          WorkoutManagementScreen.route: (_) => const WorkoutManagementScreen(),
          ExerciseScreen.route: (_) => const ExerciseScreen(),
          ExerciseManagementScreen.route: (_) =>
              const ExerciseManagementScreen(),
        }, //Routes
      ),
    );
  } // build
} // MyApp
