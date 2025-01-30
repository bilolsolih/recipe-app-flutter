import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/data/repositories/recipe_repository.dart';
import 'package:recipe_app/core/data/repositories/top_chef_repository.dart';
import 'package:recipe_app/recipe_detail/data/repositories/recipe_detail_repository.dart';
import 'package:recipe_app/recipe_detail/presentation/pages/recipe_detail_view.dart';
import 'package:recipe_app/recipe_detail/presentation/pages/recipe_detail_view_model.dart';

import 'categories/data/models/category_model.dart';
import 'categories/data/repositories/categories_repository.dart';
import 'categories/presentation/pages/categories_view.dart';
import 'categories/presentation/pages/categories_view_model.dart';
import 'categories_detail/data/models/recipe_model_small.dart';
import 'categories_detail/data/repositories/categories_detail_repository.dart';
import 'categories_detail/presentation/pages/categories_detail.dart';
import 'categories_detail/presentation/pages/categories_detail_view_model.dart';
import 'core/core.dart';
import 'home/presentation/pages/home_view.dart';
import 'home/presentation/pages/home_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());
}

GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomeView(),
    ),
    GoRoute(
      path: '/categories',
      builder: (context, state) => CategoriesView(
        viewModel: CategoriesViewModel(repo: context.read()),
      ),
      routes: [
        GoRoute(
          path: '/detail',
          builder: (context, state) => CategoriesDetailView(
            viewModel: CategoriesDetailViewModel(
              repo: context.read(),
              catsRepo: context.read(),
              selected: state.extra as CategoryModel,
            ),
          ),
          routes: [
            GoRoute(
              path: '/recipe',
              builder: (context, state) => RecipeDetailView(
                viewModel: RecipeDetailViewModel(
                  repo: context.read(),
                  selected: state.extra as RecipeModelSmall,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiClient()),
        Provider(create: (context) => CategoriesRepository(client: context.read<ApiClient>())),
        Provider(create: (context) => CategoriesDetailRepository(client: context.read())),
        Provider(create: (context) => RecipeDetailRepository(client: context.read())),
        Provider(create: (context) => RecipeRepository(client: context.read())),
        Provider(create: (context) => TopChefRepository(client: context.read())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: appThemeData,
        routerConfig: router,
      ),
    );
  }
}
