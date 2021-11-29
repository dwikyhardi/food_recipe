import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_recipe/src/feature/recipe_detail/presentation/pages/recipe_detail_pages.dart';
import 'package:food_recipe/src/feature/recipe_list/presentation/pages/favourite_recipe_list_pages.dart';
import 'package:food_recipe/src/feature/recipe_list/presentation/pages/recipe_list_pages.dart';

import 'di/injection_container.dart';
import 'feature/category_list/presentation/bloc/category_list_bloc.dart';
import 'feature/category_list/presentation/pages/category_list_pages.dart';
import 'feature/recipe_detail/presentation/bloc/recipe_detail_bloc.dart';
import 'feature/recipe_list/presentation/bloc/recipe_list_bloc.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => sl<CategoryListBloc>(),
            ),
            BlocProvider(
              create: (_) => sl<RecipeDetailBloc>(),
            ),
            BlocProvider(
              create: (_) => sl<RecipeListBloc>(),
            ),
          ],
          child: MaterialApp(
            title: 'Food Recipe',
            restorationScopeId: 'app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''), // English, no country code
            ],
            onGenerateTitle: (BuildContext context) =>
                AppLocalizations.of(context)!.appTitle,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsController.themeMode,
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  Map<String, dynamic>? arguments;
                  if(routeSettings.arguments != null){
                    arguments =
                    routeSettings.arguments as Map<String, dynamic>;
                  }
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case RecipeDetailPages.routeName:
                      return RecipeDetailPages(
                        idMeal: arguments?['idMeal'],
                      );
                    case RecipeListPages.routeName:
                      return RecipeListPages(
                        categoryName: arguments?['categoryName'],
                      );
                    case FavouriteRecipeListPages.routeName:
                      return const FavouriteRecipeListPages();
                    case CategoryListPages.routeName:
                    default:
                      return const CategoryListPages();
                  }
                },
              );
            },
          ),
        );
      },
    );
  }
}
