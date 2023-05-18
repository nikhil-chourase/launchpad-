import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../program.dart';


class CreateProgramForm extends StatefulWidget {
  final Function(Program) onSave;

  CreateProgramForm({required this.onSave});

  @override
  _CreateProgramFormState createState() => _CreateProgramFormState();
}

class _CreateProgramFormState extends State<CreateProgramForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  late String programName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create Program'),
      content: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'name',
              decoration: InputDecoration(labelText: 'Program Name'),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
              onChanged: (value) {
                setState(() {
                  programName = value!;
                });
              },
            ),
          ],
        ),
      ),
      actions: [


        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              widget.onSave(Program(name: programName));
              Navigator.pop(context);
            }
          },
          child: Text('Save'),
        ),


      ],
    );
  }
}

