import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/auth_repository.dart';
import 'package:recipe_app/core/auth_view_model.dart';
import 'package:recipe_app/core/data/repositories/top_chef_repository.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';
import 'package:recipe_app/onboarding/presentation/pages/onboarding_view.dart';
import 'package:recipe_app/onboarding/presentation/manager/onboarding_view_model.dart';
import 'package:recipe_app/profile/data/repositories/profile_repository.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view.dart';
import 'package:recipe_app/profile/presentation/pages/profile_view_model.dart';
import 'package:recipe_app/recipe_detail/data/repositories/recipe_detail_repository.dart';
import 'package:recipe_app/recipe_detail/presentation/pages/recipe_detail_view.dart';
import 'package:recipe_app/recipe_detail/presentation/pages/recipe_detail_view_model.dart';
import 'package:recipe_app/signup/presentation/pages/login_view.dart';

import 'categories/data/models/category_model.dart';
import 'categories/data/repositories/categories_repository.dart';
import 'categories/presentation/pages/categories_view.dart';
import 'categories/presentation/pages/categories_view_model.dart';
import 'categories_detail/data/models/recipe_model_small.dart';
import 'categories_detail/data/repositories/categories_detail_repository.dart';
import 'categories_detail/presentation/pages/categories_detail_view.dart';
import 'categories_detail/presentation/pages/categories_detail_view_model.dart';
import 'core/core.dart';
import 'home/presentation/pages/home_view.dart';
import 'core/secure_storage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(RecipeApp());
}

GoRouter createRouter(BuildContext context, AuthViewModel vm) {
  return GoRouter(
    refreshListenable: vm,
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeView(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(
        path: '/categories',
        builder: (context, state) {
          return CategoriesView(
            viewModel: CategoriesViewModel(repo: context.read()),
          );
        },
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
          ),
        ],
      ),
      GoRoute(
        path: '/recipe',
        builder: (context, state) => RecipeDetailView(
          viewModel: RecipeDetailViewModel(
            repo: context.read(),
            selected: state.extra as RecipeModelSmall,
            from: state.uri.queryParameters['from'] as String,
          ),
        ),
      ),
      GoRoute(
        path: '/profile/me',
        builder: (context, state) => ProfileView(
          vm: ProfileViewModel(
            repo: context.read(),
            recipeRepo: context.read(),
          ),
        ),
      ),
    ],
    redirect: (context, state) {
      // final isAuthenticated = vm.isAuthenticated;
      // final isLoggingIn = state.uri.toString() == '/login';
      //
      // if (!isAuthenticated && !isLoggingIn) {
      //   return '/login';
      // }
      //
      // if (isAuthenticated && isLoggingIn) {
      //   return '/';
      // }

      return null;
    },
  );
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MultiProvider(
      providers: [
        Provider(create: (context) => ApiClient()),
        Provider(create: (context) => ProfileRepository(client: context.read())),
        Provider(create: (context) => OnboardingRepository(client: context.read())),
        Provider(create: (context) => CategoriesRepository(client: context.read<ApiClient>())),
        Provider(create: (context) => CategoriesDetailRepository(client: context.read())),
        Provider(create: (context) => RecipeDetailRepository(client: context.read())),
        Provider(create: (context) => RecipeRepository(client: context.read())),
        Provider(create: (context) => TopChefRepository(client: context.read())),
        Provider(create: (context) => AuthRepository(client: context.read())),
        ChangeNotifierProvider(create: (context) => AuthViewModel(authRepository: context.read())),
      ],
      child: Builder(
        builder: (context) {
          final vm = context.watch<AuthViewModel>();
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: appThemeData,
            routerConfig: createRouter(context, vm),
          );
        },
      ),
    );
  }
}
