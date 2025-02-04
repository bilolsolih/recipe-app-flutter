import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view_model.dart';

class ProfileScaffoldAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileScaffoldAppBar({
    super.key,
    required this.vm,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 241);

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.padding36,
        vertical: AppSizes.padding36,
      ),
      height: 241,
      child: Column(
        children: [
          Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox.square(
                dimension: 102 * AppSizes.wRatio,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(51),
                  child: Image.network(
                    vm.myProfile!.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(
                width: 61,
                height: 102,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        RecipeIconButtonContainer(image: "assets/icons/heart.svg", callback: () {}),
                        RecipeIconButtonContainer(image: "assets/icons/heart.svg", callback: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Text("Recipe"),
              Text("Favorites"),
            ],
          )
        ],
      ),
    );
  }
}

/*
AppBar(
      leadingWidth: 102 * AppSizes.wRatio,
      leading: ClipRRect(
                  borderRadius: BorderRadius.circular(51),
                  child: Image.network(
                    vm.myProfile!.image,
                    fit: BoxFit.cover,
                  ),
                ),
      toolbarHeight: 102 * AppSizes.hRatio,
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Text("Recipe"),
          Text("Favorites"),
        ],
      ),
    )
 */
