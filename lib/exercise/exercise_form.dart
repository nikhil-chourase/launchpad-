import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../program.dart';




class CreateExerciseForm extends StatefulWidget {
  final Function(Exercise) onSave;

  CreateExerciseForm({required this.onSave});

  @override
  _CreateExerciseFormState createState() => _CreateExerciseFormState();
}

class _CreateExerciseFormState extends State<CreateExerciseForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Exercise'),
      content: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'name',
              decoration: InputDecoration(labelText: 'Exercise Name'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.saveAndValidate()) {
              final exerciseName = _formKey.currentState!.fields['name']!.value as String;
              widget.onSave(Exercise(name: exerciseName));
              Navigator.pop(context);
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
