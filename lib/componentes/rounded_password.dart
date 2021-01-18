import 'package:adote/componentes/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Senha",
          icon: Icon(
            Icons.lock,
            color: Colors.deepPurple[600],
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.deepPurple[600],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
