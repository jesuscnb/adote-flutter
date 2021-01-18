import 'package:adote/const/consts.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAccountCheck({
    Key key,
    this.press,
    this.login = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Não possui uma conta ? " : "Já possuí uma conta?",
          style: TextStyle(
            color: Consts.purple,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            login ? "Criar Conta" : " Logar",
            style: TextStyle(
              color: Consts.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
