import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';

import '../../client.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;
  List<RecipeModelSmall> yourRecipesHome = [];
  List<RecipeModelSmall> recentRecipes = [];

  Future<List<RecipeModelSmall>> fetchYourRecipes(int limit) async {
    if (yourRecipesHome.isNotEmpty) return yourRecipesHome;
    var rawRecipes = await client.fetchYourRecipes(2);
    yourRecipesHome = rawRecipes.map((recipe) => RecipeModelSmall.fromJson(recipe)).toList();
    return yourRecipesHome;
  }

  Future<List<RecipeModelSmall>> fetchRecentRecipes(int limit) async {
    if (recentRecipes.isNotEmpty) return recentRecipes;

    var rawRecipes = await client.fetchRecentRecipes(2);
    recentRecipes = rawRecipes.map((recipe) => RecipeModelSmall.fromJson(recipe)).toList();
    return recentRecipes;
  }
}
