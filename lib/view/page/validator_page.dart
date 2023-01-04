import 'package:clean_arch/common/constants/validator.dart';
import 'package:flutter/material.dart';

class ValidatorPage extends StatefulWidget {
  const ValidatorPage({super.key});

  @override
  State<ValidatorPage> createState() => _ValidatorPageState();
}

class _ValidatorPageState extends State<ValidatorPage> {
  final _formKey = GlobalKey<FormState>();
  // declare a variable to keep track of the input text

  void _submit() {
    // validate all the form fields
    if (_formKey.currentState!.validate()) {
      print(44);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.always,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(),
                ),
                labelText: 'Enter your name',
              ),
              // use the validator to return an error string (or null) based on the input text
              validator: intValidator,
              // update the state variable when the text changes
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                labelText: 'Enter your name',
              ),
              // use the validator to return an error string (or null) based on the input text
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'Can\'t be empty';
                }
                if (text.length < 4) {
                  return 'Too short';
                }
                return null;
              },
              // update the state variable when the text changes
              onChanged: (text) => setState(() {}),
            ),
            ElevatedButton(
              // only enable the button if the text is not empty
              onPressed:
                  _formKey.currentState?.validate() ?? false ? _submit : null,
              child: Text(
                'Submit',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
