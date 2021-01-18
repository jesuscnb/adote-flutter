import 'package:adote/componentes/rounded_button.dart';
import 'package:adote/componentes/rounded_input.dart';
import 'package:adote/componentes/rounded_password.dart';
import 'package:adote/const/consts.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
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
          Positioned(
            child: Image.asset(
              Consts.catDog,
              height: size.height * 0.50,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CADASTRO",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RoundedInputField(
                hintText: "Nome",
                onChanged: (value) {
                  print(value);
                },
              ),
              RoundedInputField(
                hintText: "E-mail",
                onChanged: (value) {
                  print(value);
                },
              ),
              RoundedInputField(
                hintText: "Telefone",
                icon: Icons.phone,
                onChanged: (value) {
                  print(value);
                },
              ),
              RoundedInputField(
                hintText: "Cidade",
                icon: Icons.location_city,
                onChanged: (value) {
                  print(value);
                },
              ),
              RoundedInputField(
                hintText: "Bairro",
                icon: Icons.add_location_alt_outlined,
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
                text: "CADASTRAR",
                press: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
