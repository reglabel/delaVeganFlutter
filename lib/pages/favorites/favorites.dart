import 'package:flutter/material.dart';
import 'package:finalproject2/pages/favorites/widget/food_list.dart';
import 'package:finalproject2/pages/favorites/widget/food_list_view.dart';
import 'package:finalproject2/constants/colors.dart';
import 'package:finalproject2/models/restaurant.dart';
import 'package:finalproject2/widgets/custom_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:finalproject2/aplicacao/gerenciador_food.dart';

import '../../models/food.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  var selected = 0;
  final pageController = PageController();
  late GerenciadorFoods gerenciadorFoods;
  
  late SistemaArquivos _sistemaArquivos;
  List<Food> _favoritas = [];

  final TextEditingController _controller = TextEditingController();

  @override
  initState() {
    super.initState();
     gerenciadorFoods = GerenciadorFoods();
     setState(() {
       _favoritas = gerenciadorFoods.foods;
     });

    _sistemaArquivos = SistemaArquivos('foods.json');

    Future<List<Food>> quaseFoods = _sistemaArquivos.ler();
    quaseFoods.then((foods) {
      setState(() {
        _favoritas = foods;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          FoodList(
            selected: selected,
            restaurant: restaurant,
            callback: (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            },
          ),
          Expanded(
              child: FoodListView(
            selected: selected,
            callback: (int index) {
              setState(() {
                selected = index;
              });
            },
            pageController: pageController,
            restaurant: restaurant,
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          )
        ],
      ),
    );*/
    return Scaffold(floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: const Text('Deseja visualizar favoritos?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancelar'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          gerenciadorFoods.incluirFood();
                          _sistemaArquivos.salvar(_favoritas);
                        });
                        Navigator.pop(context, 'OK');
                      },
                      child: const Text('SIM'),
                    ),
                  ],
                )),
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add_box_rounded),
      ),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Suas favoritas'),
      ),
      body: ListView.builder(
        itemCount: _favoritas.length,
        itemBuilder: (BuildContext contex, int index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
            ),
            key: ValueKey<Food>(_favoritas[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                //gerenciadorTarefas.removeTarefa(index);
                _favoritas.removeAt(index);
                _sistemaArquivos.salvar(_favoritas);
              });
            },
            child: CheckboxListTile(
                title: Text(_favoritas[index].about!),
                value: _favoritas[index].isFavorite,
                onChanged: (bool? valor) {
                  setState(() {
                    _favoritas[index].isFavorite = valor ?? false;
                    _sistemaArquivos.salvar(_favoritas);
                    // gerenciadorTarefas.atualizarTarefa(
                    //     gerenciadorTarefas.tarefas[index], index);
                  });
                }),
          );
        },
      ),
    );
  }
}
