import 'package:flutter/material.dart';
import '../providers/workout_provider.dart';

import '../screens/workout_management_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/workout_card.dart';

import './workout_management_screen.dart';

import 'package:provider/provider.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  static const route = '/workut';

  @override
  Widget build(BuildContext context) {
    //var value = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treinos'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).pushNamed(
                WorkoutManagementScreen.route,
                arguments: {'title': 'Novo Treino'}),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          FutureBuilder(
            future: Provider.of<WorkoutProvider>(context).get(),
            builder: (_, AsyncSnapshot snapshot) {
              return snapshot.connectionState == ConnectionState.done
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (_, index) {
                        return WorkoutCard(
                          snapshot.data[index].id,
                          snapshot.data[index].imageUrl,
                          snapshot.data[index].name,
                          snapshot.data[index].weekDay,
                        );
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ],
      ),
    );
  }
}
