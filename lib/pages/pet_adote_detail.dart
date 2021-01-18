import 'package:adote/const/consts.dart';
import 'package:adote/models/Pet.dart';
import 'package:flutter/material.dart';

class PetAdoteDetail extends StatelessWidget {
  final Pet pet;

  const PetAdoteDetail({Key key, this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Adoção',
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  child: Text(
                    "Para adotar ou saber mais sobre este peludo, entre em contato:",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Consts.purpleDeep),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              bottom: 10,
                            ),
                            child: Container(
                              child: Icon(
                                Icons.account_circle,
                                size: 35,
                                color: Consts.purple,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "Adriano Jesus Kowalski",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              bottom: 10,
                            ),
                            child: Icon(
                              Icons.add_call,
                              size: 35,
                              color: Consts.purple,
                            ),
                          ),
                          Container(
                            child: Text(
                              "(67) 99925-2647 ",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 10,
                              bottom: 10,
                            ),
                            child: Icon(
                              Icons.attach_email,
                              size: 35,
                              color: Consts.purple,
                            ),
                          ),
                          Container(
                            child: Text(
                              "adriano.kowalski@outlook.com",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      )),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    child: Text(
                      "E antes de adotar, lembre-se:",
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Consts.purpleDeep),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        bottom: 15,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Consts.purple,
                      ),
                    ),
                    Expanded(
                      child: Text(
                          "Animais têm sentimentos. Eles precisam de carinho e atenção todos os dias."),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        bottom: 15,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Consts.purple,
                      ),
                    ),
                    Expanded(
                      child: Text(
                          "Todos os moradores da casa devem estar de acordo com a adoção."),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        bottom: 15,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Consts.purple,
                      ),
                    ),
                    Expanded(
                      child: Text(
                          "Animais têm sentimentos. Eles precisam de carinho e atenção todos os dias."),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        bottom: 10,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Consts.purple,
                      ),
                    ),
                    Expanded(
                      child: Text(
                          "Você terá despesas com ração, vacinas e veterinário."),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        bottom: 15,
                      ),
                      child: Icon(
                        Icons.check,
                        color: Consts.purple,
                      ),
                    ),
                    Expanded(
                      child: Text(
                          "Cães e gatos vivem 15 anos ou mais e você será responsável por cuidar dele durante todo esse tempo."),
                    ),
                  ],
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
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK, Entendi",
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
        ],
      ),
    );
  }
}
