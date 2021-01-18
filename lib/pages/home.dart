import 'package:adote/const/consts.dart';
import 'package:adote/models/Pet.dart';
import 'package:adote/pages/cadastro.dart';
import 'package:adote/pages/login.dart';
import 'package:adote/pages/pet_list.dart';
import 'package:adote/pages/pet_detail.dart';
import 'package:adote/pages/sobre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CategoryType categoryType = CategoryType.other;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Consts.nearlyWhite,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            getAppBarUI(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: <Widget>[
                      getSearchBarUI(),
                      getCategoryUI(),
                      Flexible(
                        child: getPopularCourseUI(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountEmail: Text('adriano.kowalski@outlook.com'),
                accountName: Text('Adriano Jesus Kowalski'),
                currentAccountPicture: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(Consts.logo),
                ),
                decoration: BoxDecoration(color: Consts.purple),
              ),
              ListTile(
                leading: Icon(Icons.login, color: Consts.purpleDeep),
                title: Text("Login"),
                subtitle: Text("Entrar no App..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.person_add,
                  color: Consts.purpleDeep,
                ),
                title: Text("Cadastre-se"),
                subtitle: Text("Registrar no App..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Cadastro(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.local_library,
                  color: Consts.purpleDeep,
                ),
                title: Text("Quem somos"),
                subtitle: Text("Informações sobre a ONG..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Sobre(),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
              Divider(
                height: 2,
                color: Colors.black,
              ),
              ListTile(
                leading: Icon(
                  Icons.power_settings_new_rounded,
                  color: Colors.red,
                ),
                title: Text("Sair"),
                subtitle: Text("Encerrar a sessão..."),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  debugPrint('Sai!');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getCategoryUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
          child: Text(
            'Categoria',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Consts.darkerText,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: <Widget>[
              getButtonUI(CategoryType.dogs, categoryType == CategoryType.dogs),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(CategoryType.cats, categoryType == CategoryType.cats),
              const SizedBox(
                width: 16,
              ),
              getButtonUI(
                  CategoryType.other, categoryType == CategoryType.other),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }

  Widget getPopularCourseUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18, right: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Amigos',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Consts.darkerText,
            ),
          ),
          Flexible(
            child: AnimationLimiter(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(8),
                addAutomaticKeepAlives: true,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: Pet.popularCourseList.length,
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredGrid(
                      position: index,
                      columnCount: 2,
                      duration: const Duration(milliseconds: 375),
                      child: ScaleAnimation(
                        child: GestureDetector(
                          child: PetList(
                            pet: Pet.popularCourseList[index],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PetDetail(
                                        pet: Pet.popularCourseList[index],
                                      ),
                                  fullscreenDialog: true),
                            );
                          },
                        ),
                      ));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 5, right: 18),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
            ),
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Encontre seu',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.2,
                    color: Consts.grey,
                  ),
                ),
                Text(
                  'Amigo',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 0.27,
                    color: Consts.darkerText,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset(Consts.logo),
          )
        ],
      ),
    );
  }

  Widget getSearchBarUI() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.75,
            height: 64,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: HexColor('#F8FAFB'),
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(13.0),
                    bottomLeft: Radius.circular(13.0),
                    topLeft: Radius.circular(13.0),
                    topRight: Radius.circular(13.0),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: 'WorkSans',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Consts.purple,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Pesquisar',
                            border: InputBorder.none,
                            helperStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: HexColor('#B9BABC'),
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.2,
                              color: HexColor('#B9BABC'),
                            ),
                          ),
                          onEditingComplete: () {},
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: Icon(Icons.search, color: HexColor('#B9BABC')),
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    var image;
    if (CategoryType.cats == categoryTypeData) {
      txt = 'Gatos';
      image = Image.asset(Consts.catImage);
    } else if (CategoryType.dogs == categoryTypeData) {
      txt = 'Cães';
      image = Image.asset(Consts.dogImage);
    } else if (CategoryType.other == categoryTypeData) {
      txt = 'Outros';
      image = Image.asset(Consts.otherImage);
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Consts.purple : Consts.nearlyWhite,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Consts.purple)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: image,
                    ),
                    Text(
                      txt,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 0.27,
                        color: isSelected ? Consts.nearlyWhite : Consts.purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

enum CategoryType {
  cats,
  dogs,
  other,
}
