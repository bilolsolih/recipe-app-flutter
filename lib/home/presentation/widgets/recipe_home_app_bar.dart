import 'package:flutter/material.dart';
import 'package:recipe_app/categories/data/models/category_model.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/presentation/widgets/categories_horizontal_appbar_bottom.dart';
import 'package:recipe_app/home/presentation/widgets/recipe_home_app_bar_title.dart';

class RecipeHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipeHomeAppBar({
    super.key,
    required this.title,
    required this.subtitle,
    required this.categories,
    required this.selected,
  });

  final List<CategoryModel> categories;
  final CategoryModel? selected;
  final String title, subtitle;

  @override
  Size get preferredSize => const Size(double.infinity, 110);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      child: AppBar(
        toolbarHeight: 70,
        leadingWidth: double.infinity,
        leading: RecipeHomeAppBarTitle(
          title: title,
          subtitle: subtitle,
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            color: AppColors.pinkSub,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            color: AppColors.pinkSub,
            callback: () {},
          ),
        ],
        bottom: CategoriesHorizontalScrollBar(
          categories: categories,
          selected: selected,
        ),
      ),
    );
  }
}
