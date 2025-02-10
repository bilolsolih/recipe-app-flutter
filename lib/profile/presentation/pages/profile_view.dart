import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/profile/presentation/pages/profile_app_bar.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.vm});

  final ProfileViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => DefaultTabController(
        length: 2,
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
      extendBody: true,
      appBar: ProfileAppBar(vm: vm),
      body: TabBarView(
        children: [
          GridView.builder(
            padding: EdgeInsets.fromLTRB(AppSizes.padding36, 20, AppSizes.padding36, 100),
            itemCount: vm.recipes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 226,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => RecipeItem(
              recipe: vm.recipes[index],
              goBackRoute: '/profile/me',
            ),
          ),
          SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
