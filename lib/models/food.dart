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
            'Soba Noodle Soup, or Toshikoshi Soba, symbolizes good luck in the new year and is traditionally eaten by the Japanese on the 31st of December.',
        highLight: true,
        isPopular: false,
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
            ' A vibrant Thai sausage made with ground chicken, plus its spicy chile dip, from Chef Parnass Savang of Atlanta\'s Talat Market.',
        highLight: false,
        isPopular: false,
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
            'A ratatouille is, by its very definition, a combination of vegetables fried and then simmered in a tomato sauce.',
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
            'Tomato Chicken Curry (Tamatar Murgh) is an Indian chicken curry cooked with lots of fresh tomatoes and mild spices. It goes very well with Indian bread or steamed rice.',
        highLight: false,
        isPopular: true,
        isRecommend: false,
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
