import 'package:adote/componentes/already_account.dart';
import 'package:adote/componentes/rounded_button.dart';
import 'package:adote/componentes/rounded_input.dart';
import 'package:adote/componentes/rounded_password.dart';
import 'package:adote/const/consts.dart';
import 'package:adote/pages/cadastro.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Image.asset(Consts.mainTop),
            top: 0,
            left: 0,
            width: size.width * 0.35,
          ),
          Positioned(
            child: Image.asset(Consts.loginBottom),
            bottom: 0,
            right: 0,
            width: size.width * 0.4,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(
                Consts.catDog,
                height: size.height * 0.30,
              ),
              RoundedInputField(
                hintText: "E-mail",
                onChanged: (value) {
                  print(value);
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  print(value);
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {},
              ),
              AlreadyHaveAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
