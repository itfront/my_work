import 'package:flutter/material.dart';
import 'package:my_work/providers/exercise_provider.dart';
import 'package:my_work/screens/exercise_management_screen.dart';
import 'package:my_work/widgets/exercise_card.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatelessWidget {
  const ExerciseScreen({Key? key}) : super(key: key);

  static const String route = '/exercise';

  @override
  Widget build(BuildContext context) {
    final dynamic arguments = ModalRoute.of(context)?.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercícios cadastrados'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed(
              ExerciseManagementScreen.route,
              arguments: arguments,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg4.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          FutureBuilder(
              future: Provider.of<ExerciseProvider>(context)
                  .get(arguments['workoutId']),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return ExerciseCard(
                              snapshot.data[index].name,
                              snapshot.data[index].description,
                              snapshot.data[index].imageUrl);
                        })
                    : const CircularProgressIndicator();
              }),
        ],
      ),
    );
  }
}
