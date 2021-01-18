import 'package:adote/componentes/rounded_button.dart';
import 'package:adote/const/consts.dart';
import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                Image.asset(
                  Consts.catDog,
                  height: size.height * 0.30,
                ),
                Text(
                  "QUEM SOMOS?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Somos um ONG que trabalha em adoção e suporte a animais.",
                  style: TextStyle(),
                ),
                RoundedButton(
                  text: "Voltar",
                  press: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
