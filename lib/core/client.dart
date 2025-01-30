import 'package:dio/dio.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(baseUrl: "http://192.168.1.80/api/v1", followRedirects: false));

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
}

// tight-coupling vs loose-coupling

// SOLID
