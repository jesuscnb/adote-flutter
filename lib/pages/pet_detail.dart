import 'package:adote/const/consts.dart';
import 'package:adote/models/Pet.dart';
import 'package:adote/pages/pet_adote_detail.dart';
import 'package:adote/pages/pet_help_detail.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PetDetail extends StatefulWidget {
  final Pet pet;

  const PetDetail({Key key, this.pet}) : super(key: key);

  @override
  _PetDetailState createState() => _PetDetailState();
}

class _PetDetailState extends State<PetDetail> {
  var image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pet.nome,
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Consts.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Consts.purple,
            height: MediaQuery.of(context).size.height / 2.7,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                image: DecorationImage(
                  image: image == null
                      ? Image.network(widget.pet.capa).image
                      : image.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SlidingSheet(
            elevation: 0,
            cornerRadius: 16,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.6, 1.0],
              positioning: SnapPositioning.relativeToAvailableSpace,
            ),
            builder: (context, state) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Scaffold(
                  body: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Consts.purple.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Image.asset(
                                    Consts.pawImage,
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                                Text(
                                  " Raça",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Consts.purpleDeep,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontSize: 20,
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Consts.purple.withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Image.asset(
                                    Consts.sexImage,
                                    height: 35,
                                    width: 35,
                                  ),
                                ),
                                Text(
                                  " Sexo",
                                  style: TextStyle(
                                    color: Consts.purpleDeep,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontSize: 20,
                                    height: 2,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Text(
                                "${widget.pet.raca}",
                                style: TextStyle(
                                  color: Consts.purple,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 18,
                                  height: 2,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                getSexPetString(widget.pet),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Consts.purple,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                  fontSize: 18,
                                  height: 2,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: Text(
                            "${widget.pet.descricao}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Consts.purple,
                              letterSpacing: 0.6,
                              fontSize: 16,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: Container(
                            height: 85,
                            child: ListView.builder(
                              itemCount: widget.pet.fotos.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        image = Image.network(
                                            widget.pet.fotos[index]);
                                      });
                                    },
                                    child: Container(
                                      width: 110,
                                      height: 100,
                                      decoration: new BoxDecoration(
                                        color: Consts.purple,
                                        image: new DecorationImage(
                                          image: new NetworkImage(
                                              widget.pet.fotos[index]),
                                          fit: BoxFit.fill,
                                        ),
                                        borderRadius: new BorderRadius.all(
                                          new Radius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          height: 60,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Consts.purple,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) {
                                      return widget.pet.tipo == Consts.DOACAO
                                          ? PetAdoteDetail(
                                              pet: widget.pet,
                                            )
                                          : PetHelpDetail(
                                              pet: widget.pet,
                                            );
                                    },
                                    fullscreenDialog: true),
                              );
                            },
                            child: Text(
                              widget.pet.tipo == Consts.DOACAO
                                  ? "Quero Adotar"
                                  : "Quero Ajudar",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String getSexPetString(Pet pet) {
    return pet.sexo == Consts.FEMININO ? "Feminino" : "Masculino";
  }
}
