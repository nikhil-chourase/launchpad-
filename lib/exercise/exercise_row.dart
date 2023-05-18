import 'package:flutter/material.dart';

import '../program.dart';
import '../screens/dash_board_screen.dart';




class ExerciseRow extends StatelessWidget {
  final Exercise exercise;

  ExerciseRow({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        //backgroundImage: AssetImage('assets/exercise_photo.jpg'),
        radius: 20.0,
      ),
      title: Text(exercise.name),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          DashboardScreen dashboardScreen = context.findAncestorWidgetOfExactType<DashboardScreen>()!;
          dashboardScreen.setState(() {
            dashboardScreen.programs.forEach((program) {
              program.exercises.remove(exercise);
            });
          });
        },
      ),
    );
  }
}

