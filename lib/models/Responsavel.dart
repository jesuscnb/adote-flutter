class Responsavel {
  String nome;
  String telefone;
  String email;
  String senha;
  String uf;
  String cidade;
  String bairro;

  Responsavel(
      {this.nome,
      this.telefone,
      this.email,
      this.senha,
      this.uf,
      this.cidade,
      this.bairro});

  Responsavel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    telefone = json['telefone'];
    email = json['email'];
    senha = json['senha'];
    uf = json['uf'];
    cidade = json['cidade'];
    bairro = json['bairro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['telefone'] = this.telefone;
    data['email'] = this.email;
    data['senha'] = this.senha;
    data['uf'] = this.uf;
    data['cidade'] = this.cidade;
    data['bairro'] = this.bairro;
    return data;
  }
}
