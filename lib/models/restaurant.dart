import 'food.dart';

class Restaurant {
  String name;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Food>> menu;
  Restaurant({
    required this.name,
    required this.label,
    required this.logoUrl,
    required this.desc,
    required this.score,
    required this.menu,
  });

  static Restaurant generateRestaurant() {
    return Restaurant(
        name: 'DelaVegan',
        label: 'As melhores receitas aqui!',
        logoUrl: 'assets/images/res_logo.png',
        desc: 'Sua saúde em primeiro lugar',
        score: 4.7,
        menu: {
          'Recomendadas': Food.generateRecommendFoods(),
          'Populares': Food.generatePopularFood()!,
          //'Massas': [],
          //'Sobremesas': [],
        });
  }
}