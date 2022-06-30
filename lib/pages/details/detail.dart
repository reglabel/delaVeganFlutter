import 'package:flutter/material.dart';
import 'package:finalproject2/pages/details/widget/food_detail.dart';
import 'package:finalproject2/pages/details/widget/food_image.dart';
import 'package:finalproject2/constants/colors.dart';

import 'package:finalproject2/models/food.dart';
import 'package:finalproject2/widgets/custom_app_bar.dart';

IconData iconReturn(Food food){
  if(food.isFavorite!){
    return Icons.favorite;
  } else{
    return Icons.favorite_outline;
  }
}

class DetailPage extends StatelessWidget {
  final Food food;
  const DetailPage({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                leftIcon: Icons.arrow_back,
                rightIcon: iconReturn(food),
                leftCallback: () => Navigator.pop(context),
                rightCallback: () => (food.isFavorite = !food.isFavorite!),
              ),
              FoodImg(
                food: food,
              ),
              FoodDetail(
                food: food,
              )
            ],
          ),
        ),
    );
  }
}
