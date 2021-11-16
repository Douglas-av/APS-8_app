class PlantasModel {
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

  PlantasModel(
      this.numero,
      this.nome_popular,
      this.nome_cientifico,
      this.luminosidade,
      this.origem,
      this.continente,
      this.familia,
      this.tipo,
      this.altura_media,
      this.descricao);

  factory PlantasModel.fromJson(Map<String, dynamic> json) {
    return PlantasModel(
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

  Map toMap() {
    var map = new Map();
    map["numero"] = numero;
    map["nome_popular"] = nome_popular;
    map["nome_cientifico"] = nome_cientifico;
    map["luminosidade"] = luminosidade;
    map["origem"] = origem;
    map["continente"] = continente;
    map["familia"] = familia;
    map["tipo"] = tipo;
    map["altura_media"] = altura_media;
    map["descricao"] = descricao;

    return map;
  }
}
