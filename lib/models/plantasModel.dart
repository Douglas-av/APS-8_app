class Plantas{

  final int numero;
  final String nome_popular;
  final String nome_cientifico;
  final String luminosidade;
  final String origem;
  final String continente;
  final String familia;
  final String tipo;
  final String altura_media;
  final String descricao;

  Plantas(this.numero, this.nome_popular, this.nome_cientifico, this.luminosidade, this.origem, this.continente, this.familia, this.tipo, this.altura_media, this.descricao);

  factory Plantas.fromJson(Map<String, dynamic> json) {
    return Plantas(
      json["numero"],
      json["nome_popular"],
      json["nome_cientifico"],
      json["luminosidade"],
      json["origem"],
      json["continente"],
      json["familia"],
      json["tipo"],
      json["altura_media"],
      json["descricao"],
    );
  }

}

