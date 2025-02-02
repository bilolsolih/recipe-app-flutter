import 'package:flutter/material.dart';
import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';
import 'package:recipe_app/core/core.dart';

import 'recipe_time.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
  });

  final RecipeModelSmall recipe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 169 * AppSizes.wRatio,
      height: 226 * AppSizes.hRatio,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 159 * AppSizes.wRatio,
              height: 76 * AppSizes.hRatio,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
                border: Border.all(color: AppColors.pinkSub, width: 1),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 129 * AppSizes.wRatio,
                    child: Text(
                      recipe.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        fontFamily: "League Spartan",
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RecipeRating(rating: recipe.rating),
                      RecipeTime(time: recipe.time),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.25), offset: Offset(0, 4), blurRadius: 4),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                recipe.image,
                width: 169 * AppSizes.wRatio,
                height: 153 * AppSizes.hRatio,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 7,
            right: 8,
            child: RecipeIconButtonContainer(
              image: 'assets/icons/heart.svg',
              iconColor: recipe.isLiked ? Colors.white : AppColors.pinkSub,
              containerColor: recipe.isLiked ? AppColors.redPinkMain : AppColors.pink,
              callback: () {},
            ),
          ),
        ],
      ),
    );
  }
}
