import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:recipe_app/core/secure_storage.dart';

class DioInstance {
  final Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.80/api/v1"));

  DioInstance() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await SecureStorage.getToken();
          if (token != null) {
            options.headers['Authorization'] = "Bearer $token";
          }
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {}
          return handler.next(error);
        },
      ),
    );
  }
}

class ApiClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.1.80/api/v1",
      validateStatus: (status) => true,
    ),
  );

  Future<Map<String, String>> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: json.encode({"login": login, "password": password}),
    );

    if (response.statusCode == 200) {
      var data = Map<String, String>.from(response.data);
      return data;
    } else {
      throw Exception("User not found");
    }
  }

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
    var response = await dio.get('/recipes/list?UserId=1&Limit=$limit');
    List<dynamic> data = response.data;
    return data;
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

  Future<dynamic> fetchMyProfile() async {
    var response = await dio.get('/auth/details/3');

    return response.data;
  }

  Future<List<dynamic>> fetchTopChefs(int limit) async {
    var response = await dio.get('/auth/top-chefs?Limit=$limit');
    List<dynamic> data = response.data;
    return data;
  }
}
