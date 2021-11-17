import 'package:flutter/cupertino.dart';

class Parametros {
  Map _parametros = {
    "numero": "int",
    "nome_popular": "string",
    "nome_cientifico": "string",
    "luminosidade": "string",
    "origem": "string",
    "continente": "string",
    "familia": "string",
    "tipo": "string",
    "altura_media": "string",
    "descricao": "string"
  };

  Map parametrosExemplo = {
    'numero':[
      'Numero',
      '10 (0 para nova planta)',
      'Informar o numero da planta.',
      TextInputType.number,
      TextEditingController,
      false,
    ],
    'nome_popular': [
      'Nome popular',
      'Pata de vaca',
      'Informar o nome da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
    'nome_cientifico': [
      'Nome científico',
      'Bauhinia blakeana',
      'Informar o nome científico da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
    'luminosidade': [
      'Luminosidade',
      'Sol Pleno',
      'Informar a luminosidade da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
    'origem': [
      'Origem',
      'China',
      'Informar a origem da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
    'continente': [
      'Continente',
      'Asia',
      'Informar o continente da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
    'familia': [
      'Família',
      'Fabaceae',
      'Informar a família da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
    'tipo': [
      'Tipo',
      'Flor',
      'Informar o tipo da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
    'altura_media': [
      'Altura média',
      '9m',
      'Informar a altura média da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
    'descricao': [
      'Descrição',
      'A bau\u00ednia de hong kong \u00e9 uma bela \u00e1rvore semi dec\u00eddua, est\u00e9ril, resultante provavelmente da hibridiza\u00e7\u00e3o entre as esp\u00e9cies Bauhinia variegata e Bauhinia purpurea. Ela \u00e9 end\u00eamica e origin\u00e1ria de Hong Kong, al\u00e9m de sua flor ser o s\u00edmbolo que estampa a bandeira da cidade. Seu porte \u00e9 m\u00e9dio e o crescimento \u00e9 r\u00e1pido, alcan\u00e7ando de 6 a 12 metros de altura por 3 a 8 metros de largura de copa. Sua madeira \u00e9 mole, tornando a suscet\u00edvel a quebras em temporais e ataques de pragas.'
          .toString(),
      'Informar a descrição da planta',
      TextInputType.text,
      TextEditingController,
      false,
    ],
  };
}
