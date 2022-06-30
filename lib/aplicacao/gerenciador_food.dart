import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:finalproject2/models/food.dart';

class SistemaArquivos {
  late String nomeArquivo;

  SistemaArquivos(this.nomeArquivo);
  //void inicializa(String nomeArquivo) {}

  _obterArquivo() async {
    var diretorio = await getApplicationDocumentsDirectory();
    return File('${diretorio.path}/$nomeArquivo');
  }

  Future<void> salvar(List<Food> foods) async {
    var lista = [];

    for (Food food in foods) {
      lista.add(food.paraJson());
    }

    String docJson = jsonEncode(lista);
    File arquivo = await _obterArquivo();
    await arquivo.writeAsString(docJson);
  }

  Future<List<Food>> ler() async {
    File arquivo = await _obterArquivo();
    //print('Arquivo: ${arquivo.path}');

    try {
      String arqJson = await arquivo.readAsString();
      List lista = jsonDecode(arqJson);
      List<Food> itens = [];
      for (var item in lista) {
        itens.add(Food.doJson(item as Map<String, dynamic>));
      }
      return itens;
    } catch (e) {
      return [];
    }
  }
}

class GerenciadorFoods {
  List<Food> _foods = [];
  final SistemaArquivos _sistemaArquivos = SistemaArquivos('favorites.json');

  GerenciadorFoods() {
    var listaFutura = _sistemaArquivos.ler();
    listaFutura.then((foods) => _foods = foods);
  }

  List<Food> get foods => _foods;

  void incluirFood() {
    _foods.addAll(Food.allFoods.where((element) => element.isFavorite == true));
    _sistemaArquivos.salvar(_foods);
  }

  void removeFood(int indice) {
    _foods.removeAt(indice);
    _sistemaArquivos.salvar(_foods);
  }

  void atualizarFood(Food food, int indice) {
    _foods[indice] = food;
    _sistemaArquivos.salvar(_foods);
  }
}
