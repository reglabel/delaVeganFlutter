import 'package:flutter/material.dart';
import 'package:finalproject2/pages/details/widget/food_detail.dart';
import 'package:finalproject2/pages/details/widget/food_image.dart';
import 'package:finalproject2/constants/colors.dart';

import 'package:finalproject2/models/food.dart';
import 'package:finalproject2/widgets/custom_app_bar.dart';

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
                rightIcon: Icons.favorite_outline,
                leftCallback: () => Navigator.pop(context),
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
