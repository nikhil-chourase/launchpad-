import 'package:flutter/material.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../exercise/exercise_form.dart';
import '../exercise/exercise_list.dart';
import '../exercise/exercise_row.dart';
import '../program.dart';
import 'dash_board_screen.dart';



class ProgramRow extends StatefulWidget {
  final Program program;

  ProgramRow({required this.program});

  @override
  _ProgramRowState createState() => _ProgramRowState();
}
class _ProgramRowState extends State<ProgramRow> {
  bool isEditing = false;
  late Program editedProgram;
  List<Exercise> selectedExercises = [];

  @override
  void initState() {
    super.initState();
    editedProgram = widget.program;
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actions: [
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () {
            setState(() {
              isEditing = true;
            });
          },
        ),
      ],
      secondaryActions: [
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () {
            setState(() {
              DashboardScreen dashboardScreen = context.findAncestorWidgetOfExactType<DashboardScreen>()!;
              dashboardScreen.setState(() {
                dashboardScreen.programs.remove(widget.program);
              });
            });
          },
        ),
      ],
      child: ExpansionTile(
        title: Text(editedProgram.name),
        children: [
          if (editedProgram.exercises.isNotEmpty)
            ExerciseList(program: editedProgram),
          SizedBox(height: 16.0),
          if (!isEditing)
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditing = true;
                  });
                },
                child: Text('Edit Program'),
              ),
            ),
          if (isEditing)
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = false;
                      });
                    },
                    child: Text('Save'),
                  ),
                  SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      DashboardScreen dashboardScreen = context.findAncestorWidgetOfExactType<DashboardScreen>()!;
                      dashboardScreen.setState(() {
                        dashboardScreen.programs.remove(widget.program);
                      });
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            ),
          if (isEditing)
            SizedBox(height: 16.0),
          if (isEditing)
            CreateExerciseForm(
              onSave: (Exercise exercise) {
                setState(() {
                  editedProgram.exercises.add(exercise);
                });
              },
            ),
        ],
      ),
    );
  }
}
