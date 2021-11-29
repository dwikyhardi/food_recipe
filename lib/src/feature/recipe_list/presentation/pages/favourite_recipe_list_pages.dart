import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/entities/recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/presentation/bloc/recipe_list_bloc.dart';

class FavouriteRecipeListPages extends StatefulWidget {
  static const routeName = '/favourite_list_page';

  const FavouriteRecipeListPages({Key? key}) : super(key: key);

  @override
  _FavouriteRecipeListPagesState createState() =>
      _FavouriteRecipeListPagesState();
}

class _FavouriteRecipeListPagesState extends State<FavouriteRecipeListPages> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecipeListBloc>(context).add(
      const GetRecipeListEvent(
        categoryName: '',
        isFav: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Recipes'),
      ),
      body: StreamBuilder<List<RecipeList>>(
          stream: BlocProvider.of<RecipeListBloc>(context).streamFavRecipe(),
          builder: (context, snapshot) {
            Size size = MediaQuery.of(context).size;
            if (snapshot.hasData) {
              return GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: size.height * 0.26,
                  ),
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (BuildContext buildContext, int index) {
                    return AnimationConfiguration.staggeredGrid(
                      columnCount: 2,
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: FadeInAnimation(
                        duration: const Duration(milliseconds: 500),
                        child: cardRecipe(
                          snapshot.data?[index],
                          size,
                        ),
                      ),
                    );
                  });
            } else {
              return const SizedBox();
            }
          }),
    );
  }

  Widget cardRecipe(RecipeList? recipeList, Size size) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: () {
        BlocProvider.of<RecipeListBloc>(context).add(OpenRecipeDetailEvent(
            idMeal: recipeList?.idMeal ?? '',
            mealName: recipeList?.strMeal ?? '',
            buildContext: context));
      },
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: recipeList?.strThumb ?? '',
                  height: size.height * 0.2,
                  width: size.width,
                  fit: BoxFit.cover,
                  placeholder: (_, s) {
                    return const CupertinoActivityIndicator();
                  },
                  errorWidget: (_, s, d) {
                    return const Placeholder();
                  },
                ),
              ),
              Positioned(
                right: 0.0,
                bottom: 0.0,
                child: _favouriteButton(recipeList),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            recipeList?.strMeal ?? '',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  StreamBuilder<List<String>> _favouriteButton(RecipeList? recipeList) {
    return StreamBuilder<List<String>>(
        stream: BlocProvider.of<RecipeListBloc>(context).streamFavRecipeId(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool isFav =
                (snapshot.data?.contains(recipeList?.idMeal ?? '-') ?? false);
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: InkWell(
                onTap: () {
                  BlocProvider.of<RecipeListBloc>(context).add(
                    SetFavouriteRecipeListEvent(
                        idMeal: recipeList?.idMeal ?? '', isFav: isFav),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: CupertinoColors.white,
                  child: Icon(
                    Icons.favorite,
                    color: isFav
                        ? CupertinoColors.systemRed
                        : CupertinoColors.inactiveGray,
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        });
  }
}
