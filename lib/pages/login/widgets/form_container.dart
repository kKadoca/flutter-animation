import 'package:flutter/material.dart';
import 'package:testing_flutter/pages/login/widgets/input_field.dart';

class FormContainer extends StatelessWidget {
  const FormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        child: Column(
          children: <Widget>[
            InputField(
                'Username',
                false,
                Icons.person_outline
            ),
            InputField(
                'Password',
                true,
                Icons.lock_outline
            ),
          ],
        )
      ),
    );
  }
}
