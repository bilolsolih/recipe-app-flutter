import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/core/routing/routes.dart';

import '../../core.dart';

class RecipeBottomNavigationBar extends StatelessWidget {
  const RecipeBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          child: BottomShadow(),
        ),
        Positioned(
          bottom: 36,
          child: BottomNavigationBarVanilla(),
        ),
      ],
    );
  }
}

class BottomNavigationBarVanilla extends StatelessWidget {
  const BottomNavigationBarVanilla({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.bottomNavBarWidth,
      height: AppSizes.bottomNavBarHeight,
      decoration: BoxDecoration(
        color: AppColors.redPinkMain,
        borderRadius: BorderRadius.circular(33),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RecipeIconButton(
            image: "assets/icons/home.svg",
            width: 25,
            height: 22,
            color: Colors.white,
            callback: () => context.go(Routes.home),
          ),
          RecipeIconButton(
            image: "assets/icons/community.svg",
            width: 24,
            height: 22,
            color: Colors.white,
            callback: () {},
          ),
          RecipeIconButton(
            image: "assets/icons/categories.svg",
            width: 27,
            height: 27,
            color: Colors.white,
            callback: () => context.go(Routes.categories),
          ),
          RecipeIconButton(
            image: "assets/icons/profile.svg",
            width: 15,
            height: 22,
            color: Colors.white,
            callback: () => context.go(Routes.myProfile),
          )
        ],
      ),
    );
  }
}
