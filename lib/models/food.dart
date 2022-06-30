class Food {
  String? imgUrl;
  String? desc;
  String? name;
  String? waitTIme;
  num? score;
  String? cal;
  num? price;
  num? index;
  List<Map<String, String>>? ingredients;
  String? about;
  bool? highLight;
  bool? isPopular;
  bool? isRecommend;
  bool? isFavorite;
  Food(
      {this.imgUrl,
      this.desc,
      this.name,
      this.waitTIme,
      this.score,
      this.cal,
      this.price,
      this.index,
      this.ingredients,
      this.about,
      this.highLight = false,
      this.isPopular = false,
      this.isRecommend = false,
      this.isFavorite = false});

  static List<Food> allFoods = [
    Food(
        imgUrl: 'assets/images/dish1.png',
        desc: 'No1. in sales',
        name: 'Soba Soup',
        waitTIme: '50min',
        score: 4.8,
        cal: '325 Kcal',
        price: 12,
        index: 1,
        ingredients: [
          {'Noodle': 'assets/images/ingre1.png'},
          {'Shrimp': 'assets/images/ingre2.png'},
          {'Egg': 'assets/images/ingre3.png'},
          {'Scallion': 'assets/images/ingre4.png'},
          {'Noodle': 'assets/images/ingre1.png'},
        ],
        about:
            'Dissolve gelatine in pot.\nAdd orange juice and sugar.\nTake pot off the stove.\nAdd 2 tablespoons of yoghurt.\nStir gelatin under remaining yoghurt.\nCool everything down in the refrigerator.\nWhip the cream and lift it under die orange mass.\nCool down again for at least 4 hours.\nServe with orange peel.',
        highLight: true,
        isPopular: true,
        isRecommend: false,
        isFavorite: true),
    Food(
        imgUrl: 'assets/images/dish2.png',
        desc: 'No1. in sales',
        name: 'Sei Ua Samun Phrai',
        waitTIme: '50min',
        score: 4.8,
        cal: '325 Kcal',
        price: 12,
        index: 2,
        ingredients: [
          {'Noodle': 'assets/images/ingre1.png'},
          {'Shrimp': 'assets/images/ingre2.png'},
          {'Egg': 'assets/images/ingre3.png'},
          {'Scallion': 'assets/images/ingre4.png'},
          {'Noodle': 'assets/images/ingre1.png'},
        ],
        about:
            'Form 2 patties.\nFry the patties for c. 4 minutes on each side.\nQuickly fry the buns for c. 1 minute on each side.\nBruch buns with ketchup.\nServe burger with tomato, cucumber and onion',
        highLight: false,
        isPopular: true,
        isRecommend: true,
        isFavorite: false),
    Food(
        imgUrl: 'assets/images/dish3.png',
        desc: 'No1. in sales',
        name: 'Ratatoullie Pasta',
        waitTIme: '50min',
        score: 4.8,
        cal: '325 Kcal',
        price: 12,
        index: 3,
        ingredients: [
          {'Noodle': 'assets/images/ingre1.png'},
          {'Shrimp': 'assets/images/ingre2.png'},
          {'Egg': 'assets/images/ingre3.png'},
          {'Scallion': 'assets/images/ingre4.png'},
          {'Noodle': 'assets/images/ingre1.png'},
        ],
        about:
            'Tenderize the veal to about 2–4mm, and salt on both sides.\nOn a flat plate, stir the eggs briefly with a fork.\nLightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.\nHeat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.\nMake sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes "fluffy".\nRemove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.\nPlace the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.',
        highLight: false,
        isPopular: false,
        isRecommend: true,
        isFavorite: false),
    Food(
        imgUrl: 'assets/images/dish4.png',
        desc: 'Most Popular',
        name: 'Tomato Chicken',
        waitTIme: '50min',
        score: 4.8,
        cal: '325 Kcal',
        price: 12,
        index: 4,
        ingredients: [
          {'Noodle': 'assets/images/ingre1.png'},
          {'Shrimp': 'assets/images/ingre2.png'},
          {'Egg': 'assets/images/ingre3.png'},
          {'Scallion': 'assets/images/ingre4.png'},
          {'Noodle': 'assets/images/ingre1.png'},
        ],
        about:
            'Cut the tomatoes and the onion into small pieces. Boil some water - add salt to it once it boils.\n Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.\n In the meantime, heaten up some olive oil and add the cut onion.\n After 2 minutes, add the tomato pieces, salt, pepper and your other spices.\n The sauce will be done once the spaghetti are.\n Feel free to add some cheese on top of the finished dish.',
        highLight: false,
        isPopular: true,
        isRecommend: true,
        isFavorite: false),
  ];

  static List<Food> generateRecommendFoods() {
    List<Food> listFoods = [];
    for (Food food in Food.allFoods) {
      if (food.isRecommend!) {
        listFoods.add(food);
      }
    }
    return listFoods;
  }

  static List<Food>? generatePopularFood() {
    List<Food> listFoods = [];
    for (Food food in Food.allFoods) {
      if (food.isPopular!) {
        listFoods.add(food);
      }
    }
    return listFoods;
  }

  Food.doJson(Map<String, dynamic> json) {
    imgUrl = json['imgUrl'];
    desc = json['desc'];
    name = json['name'];
    waitTIme = json['waitTIme'];
    score = json['score'];
    cal = json['cal'];
    price = json['price'];
    index = json['index'];
    ingredients = json['ingredients'];
    about = json['about'];
    highLight = json['highLight'];
    isPopular = json['isPopular'];
    isRecommend = json['isRecommend'];
  }

  Map paraJson() => {
        'imgUrl': imgUrl,
        'desc': desc,
        'name': name,
        'waitTIme': waitTIme,
        'score': score,
        'cal': cal,
        'price': price,
        'index': index,
        'ingredients': ingredients,
        'about': about,
        'highLight': highLight,
        'isPopular': isPopular,
        'isRecommend': isRecommend,
      };
}
