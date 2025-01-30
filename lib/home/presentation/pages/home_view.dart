import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/home/presentation/widgets/trending_recipe/trending_recipe_section_home.dart';

import '../widgets/recipe_home_app_bar.dart';
import 'home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.viewModel,
  });

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => Scaffold(
        extendBody: true,
        appBar: RecipeHomeAppBar(
          title: "Hi! Dianne",
          subtitle: "What are you cooking today?",
          categories: viewModel.categories,
          selected: viewModel.categories.firstOrNull,
        ),
        body: ListView(
          children: [
            SizedBox(height: 16),
            TrendingRecipeSectionHome(),
            SizedBox(height: 16),
          ],
        ),
        bottomNavigationBar: RecipeBottomNavigationBar(),
      ),
    );
  }
}
