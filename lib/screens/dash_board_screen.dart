import 'package:flutter/material.dart';
import 'package:launchpad/screens/program_form.dart';
import 'package:launchpad/screens/program_row.dart';

import '../program.dart';




class DashboardScreen extends StatefulWidget {
  get programs => null;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();

  void setState(Null Function() param0) {}
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Program> programs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness Programs'),
      ),
      body: ListView.builder(
        itemCount: programs.length,
        itemBuilder: (context, index) {
          return ProgramRow(program: programs[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CreateProgramForm(
                onSave: (Program program) {
                  setState(() {
                    programs.add(program);
                  });
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
