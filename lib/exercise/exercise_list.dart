import 'package:flutter/material.dart';

import '../program.dart';
import '../screens/dash_board_screen.dart';


class ExerciseList extends StatelessWidget {
  final Program program;

  ExerciseList({required this.program});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: program.exercises.length,
      itemBuilder: (context, index) {
        return ExerciseRow(exercise: program.exercises[index]);
      },
    );
  }
}

class ExerciseRow extends StatelessWidget {
  final Exercise exercise;

  ExerciseRow({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48.0,
        height: 48.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.fitness_center),
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
