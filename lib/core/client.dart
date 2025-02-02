import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(baseUrl: "http://10.10.3.220/api/v1", followRedirects: false));

  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get('/onboarding/list');
    List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchTrendingRecipe() async {
    return {
      "id": 3,
      "title": "Salami and cheese pizza",
      "description": "This is a quick overview of the ingredients for the recipe",
      "photo": "assets/images/salami_pizza.png",
      "timeRequired": 30,
      "rating": 5.0,
      "isLiked": true,
    };
  }

  Future<List<dynamic>> fetchYourRecipes(int limit) async {
    return [
      {
        "id": 1,
        "title": "Tiramisu",
        "description": "This is a quick overview of the ingredients for the recipe",
        "photo": "assets/images/salami_pizza.png",
        "timeRequired": 15,
        "rating": 4.3,
        "isLiked": false,
      },
      {
        "id": 2,
        "title": "Chicken Burger",
        "description": "This is a quick overview of the ingredients for the recipe",
        "photo": "assets/images/salami_pizza.png",
        "timeRequired": 15,
        "rating": 4.8,
        "isLiked": true,
      },
    ];
  }

  Future<List<dynamic>> fetchRecentRecipes(int limit) async {
    return [
      {
        "id": 4,
        "title": "Lemonade",
        "description": "This is a quick overview of the ingredients for the recipe",
        "photo": "assets/images/salami_pizza.png",
        "timeRequired": 30,
        "rating": 4.0,
        "isLiked": false,
      },
      {
        "id": 5,
        "title": "Chicken Burger",
        "description": "This is a quick overview of the ingredients for the recipe",
        "photo": "assets/images/salami_pizza.png",
        "timeRequired": 25,
        "rating": 4.3,
        "isLiked": true,
      },
    ];
  }

  Future<List<dynamic>> fetchCategories() async {
    var response = await dio.get('/categories/list');
    List<dynamic> data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipes(int categoryId) async {
    var response = await dio.get('/recipes/list?Category=$categoryId');
    List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    dynamic data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchTopChefs(int limit) async {
    return [
      {
        "id": 1,
        "firstName": "Joseph",
        "photo": "assets/images/edward.png",
      },
      {
        "id": 2,
        "firstName": "Andrew",
        "photo": "assets/images/edward.png",
      },
      {
        "id": 3,
        "firstName": "Emily",
        "photo": "assets/images/edward.png",
      },
      {
        "id": 4,
        "firstName": "Jessica",
        "photo": "assets/images/edward.png",
      },
    ];
  }
}
