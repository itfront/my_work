import 'package:flutter/material.dart';
import 'package:my_work/screens/workout_management_screen.dart';

import '../screens/exercise_screen.dart';
import './workout_screen_custom_clipper.dart';

import '../utils/utils_system.dart';

class WorkoutCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String name;
  final int weekDay;

  // ignore: use_key_in_widget_constructors
  const WorkoutCard(this.id, this.imageUrl, this.name, this.weekDay);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(WorkoutManagementScreen.route, arguments: {
        'title': 'Editando $name',
        'id': id,
      }),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: mediaQuery.size.width * 0.4,
              child: ClipPath(
                clipper: WorkoutScreenCustomClipper(),
                child: const Image(
                  image: AssetImage(
                    'assets/images/treino2.jpg',
                  ),
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    Utils.getWeekDayName(weekDay),
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                        onPressed: () => Navigator.of(context).pushNamed(
                            ExerciseScreen.route,
                            arguments: {'workoutId': id}),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromRGBO(0, 223, 100, 1),
                          ),
                        ), //StyleForm
                        child: const Text('Exercícios'),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
