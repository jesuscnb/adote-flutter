import 'package:adote/const/consts.dart';
import 'package:adote/models/Pet.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class PetList extends StatelessWidget {
  final Pet pet;

  const PetList({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 45),
              child: Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: new DecorationImage(
                    image: Image.network(pet.capa).image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25, left: 10),
                child: Text(
                  '${pet.nome}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Consts.purple,
                  ),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2, left: 13),
                child: Text(
                  '${pet.porte}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Consts.purple,
                  ),
                ),
              ),
              alignment: Alignment.bottomLeft,
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2, left: 13),
                child: Badge(
                  toAnimate: false,
                  shape: BadgeShape.square,
                  badgeColor: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                  badgeContent: Text('${pet.tipo}',
                      style: TextStyle(color: Colors.white, fontSize: 10)),
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
            Align(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2, right: 8),
                child: getSexPetImage(pet),
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.purple),
        ),
      ),
    );
  }

  Widget getSexPetImage(Pet pet) {
    return pet.sexo == Consts.FEMININO
        ? Image.asset(
            Consts.femaleImage,
            height: 17,
            width: 17,
          )
        : Image.asset(
            Consts.maleImage,
            height: 17,
            width: 17,
          );
  }
}
