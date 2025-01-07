import 'package:flutter/material.dart';
import 'package:loginvalidation/core/color/pallette.dart';
import 'package:loginvalidation/core/customs_widgets/validation_component.dart';

class TextFormComponent extends StatelessWidget {
  final Validationcomponent validation = Validationcomponent();
  final String labelStringEmail;
  final String hintForTextEmail;
  final String labelStringPassword;
  final String hintForTextPassword;
  TextFormComponent({
    super.key,
    required this.labelStringEmail,
    required this.hintForTextEmail,
    required this.labelStringPassword,
    required this.hintForTextPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return validation.emailValidation(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Pallette.textFormfeilBackground,
              hintText: hintForTextEmail,
              labelText: labelStringEmail,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Pallette.primary),
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            obscureText: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return validation.passwordValidation(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Pallette.textFormfeilBackground,
              hintText: hintForTextPassword,
              labelText: labelStringPassword,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
