import 'package:adote/models/Responsavel.dart';

class Pet {
  String nome;
  String sexo;
  String especie;
  String tipo;
  String idade;
  String raca;
  String porte;
  String descricao;
  String capa;
  List<String> fotos;
  Responsavel responsavel;

  Pet(
      {this.nome,
      this.sexo,
      this.especie,
      this.tipo,
      this.idade,
      this.raca,
      this.porte,
      this.descricao,
      this.capa,
      this.fotos,
      this.responsavel});

  Pet.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    sexo = json['sexo'];
    especie = json['especie'];
    tipo = json['tipo'];
    idade = json['idade'];
    raca = json['raca'];
    porte = json['porte'];
    descricao = json['descricao'];
    capa = json['capa'];
    fotos = json['fotos'].cast<String>();
    responsavel = json['responsavel'] != null
        ? new Responsavel.fromJson(json['responsavel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['sexo'] = this.sexo;
    data['especie'] = this.especie;
    data['tipo'] = this.tipo;
    data['idade'] = this.idade;
    data['raca'] = this.raca;
    data['porte'] = this.porte;
    data['descricao'] = this.descricao;
    data['capa'] = this.capa;
    data['fotos'] = this.fotos;
    if (this.responsavel != null) {
      data['responsavel'] = this.responsavel.toJson();
    }
    return data;
  }

  static List<Pet> popularCourseList = <Pet>[
    Pet(
      nome: 'Frederico',
      sexo: 'M',
      especie: 'CAO',
      tipo: "DOACAO",
      idade: "2A",
      descricao: 'Dois anos e muito bagunceiro',
      porte: 'P',
      raca: 'Dachshund',
      capa:
          'https://i0.wp.com/petcaramelo.com/wp-content/uploads/2018/09/teckel-cachorro.png?resize=700%2C466&ssl=1',
      fotos: [
        'https://i0.wp.com/petcaramelo.com/wp-content/uploads/2018/09/teckel-cachorro.png?resize=700%2C466&ssl=1',
        'https://i0.wp.com/petcaramelo.com/wp-content/uploads/2018/09/teckel-cachorro.png?resize=700%2C466&ssl=1'
      ],
    ),
    Pet(
      nome: 'Mel',
      sexo: 'F',
      especie: 'GATO',
      tipo: "COSTEIO",
      idade: "5M",
      descricao: 'Gatinha mamadora de coberta',
      porte: 'M',
      raca: 'Comum',
      capa:
          'https://www.petlove.com.br/dicas/wp-content/uploads/2020/01/gato-laranja-1280x720.jpg',
      fotos: [
        'https://www.petlove.com.br/dicas/wp-content/uploads/2020/01/gato-laranja-1280x720.jpg',
        'https://www.perdiomeu.com.br/oc-content/uploads/87/4612.jpg',
        'https://static1.patasdacasa.com.br/articles/9/17/49/@/8373-gato-laranja-ruivo-ou-amarelo-e-so-amor-articles_media_mobile-2.jpg',
      ],
    ),
  ];
}
