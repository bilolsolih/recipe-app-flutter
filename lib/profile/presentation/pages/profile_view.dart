import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.vm});

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => DefaultTabController(
        length: 3,
        child: switch (vm.loading) {
          true => Center(child: CircularProgressIndicator()),
          false => ProfileScaffold(vm: vm),
        },
      ),
    );
  }
}

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({
    super.key,
    required this.vm,
  });

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
            child: Column(
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
                TabBar(
                  padding: EdgeInsets.zero,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 5,
                  dividerColor: Colors.transparent,
                  // indicator: BoxDecoration(
                  //   color: Colors.red,
                  //   borderRadius: BorderRadius.circular(10),
                  // ),
                  tabs: [
                    Text(""),
                    Text(""),
                    Text(""),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        children: [
          Text("Page 1 Recipes"),
          Text("Page 2 Favorites"),
          Text("Page 3 Negatives"),
        ],
      ),
    );
  }
}
