import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/profile/presentation/pages/profile_app_bar_stats_column.dart';

class ProfileAppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBarBottom({
    super.key,
  });

  @override
  Size get preferredSize => Size(double.infinity, 130);

  @override
  Widget build(BuildContext context) {
    return Column(
    spacing: 18,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RecipeElevatedButton(
              text: "Edit Profile",
              fontSize: 15,
              callback: () {},
              size: Size(175 * AppSizes.wRatio, 27),
            ),
            RecipeElevatedButton(
              text: "Share Profile",
              fontSize: 15,
              callback: () {},
              size: Size(175 * AppSizes.wRatio, 27),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.pink, width: 1),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProfileAppBarStatsColumn(number: 60, label: "recipes"),
              Container(width: 2, height: 26, color: AppColors.pink),
              ProfileAppBarStatsColumn(number: 120, label: "Following"),
              Container(width: 2, height: 26, color: AppColors.pink),
              ProfileAppBarStatsColumn(number: 250, label: "Followers"),
            ],
          ),
        ),
        TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Text(
              "Recipe",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "Favorites",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
