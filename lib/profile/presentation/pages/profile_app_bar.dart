import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/profile/presentation/pages/profile_app_bar_bottom.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view_model.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
    required this.vm,
  });

  @override
  Size get preferredSize => Size(double.infinity, 240);

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
      child: AppBar(
        toolbarHeight: 102 * AppSizes.hRatio,
        leadingWidth: 102 * AppSizes.wRatio,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(51),
          child: Image.network(
            vm.myProfile!.image,
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          spacing: 3,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vm.myProfile!.fullName,
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "@${vm.myProfile!.username}",
              style: TextStyle(color: AppColors.pinkSub, fontSize: 12),
            ),
            Text(
              vm.myProfile!.bio,
              maxLines: 3,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "League Spartan",
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        actions: [
          Align(
            alignment: Alignment.topCenter,
            child: RecipeIconButtonContainer(
              image: "assets/icons/heart.svg",
              callback: () {},
            ),
          ),
          SizedBox(width: 5),
          Align(
            alignment: Alignment.topCenter,
            child: RecipeIconButtonContainer(
              image: "assets/icons/heart.svg",
              callback: () {},
            ),
          ),
        ],
        bottom: ProfileAppBarBottom(),
      ),
    );
  }
}
