import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExerciseCard extends StatelessWidget {
  //const ExerciseCard({Key? key}) : super(key: key);

  String name;
  String description;
  String imageUrl;

  ExerciseCard(this.name, this.description, this.imageUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          description,
          style: TextStyle(color: Theme.of(context).textTheme.subtitle2!.color),
        ),
        leading: Image.network(
          imageUrl,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
        trailing: const IconButton(onPressed: null, icon: Icon(Icons.delete)),
      ),
    );
  }
}
