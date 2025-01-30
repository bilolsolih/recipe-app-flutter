import 'package:flutter/cupertino.dart';
import 'package:recipe_app/categories/data/models/category_model.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';

class HomeViewModel extends ChangeNotifier {
  HomeViewModel({required CategoriesRepository catsRepo}) : _catsRepo = catsRepo {
    load();
  }

  final CategoriesRepository _catsRepo;

  List<CategoryModel> categories = [];

  Future<void> load() async {
    categories = await _catsRepo.fetchCategories();
    notifyListeners();
  }
}
