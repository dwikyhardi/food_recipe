import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_recipe/src/core/widget/favourite_appbar_button.dart';
import 'package:food_recipe/src/feature/recipe_list/domain/entities/recipe_list.dart';
import 'package:food_recipe/src/feature/recipe_list/presentation/bloc/recipe_list_bloc.dart';

class RecipeListPages extends StatefulWidget {
  static const routeName = '/recipe_list';
  final String categoryName;

  const RecipeListPages({Key? key, required this.categoryName})
      : super(key: key);

  @override
  State<RecipeListPages> createState() => _RecipeListPagesState();
}

class _RecipeListPagesState extends State<RecipeListPages> with WidgetsBindingObserver{
  @override
  void initState() {
    super.initState();

    BlocProvider.of<RecipeListBloc>(context).add(
      GetRecipeListEvent(
        categoryName: widget.categoryName,
        isFav: false
      ),
    );
    WidgetsBinding.instance!.addObserver(this);
  }


  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('didChangeAppLifecycleState ================ $state');
  }

  // @override
  // void didUpdateWidget(covariant RecipeListPages oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   BlocProvider.of<RecipeListBloc>(context).add(
  //     GetRecipeListEvent(
  //         categoryName: widget.categoryName,
  //         isFav: false
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: BlocBuilder<RecipeListBloc, RecipeListState>(
        builder: (context, state) {
          if (state is RecipeListEmpty) {
            return const Center(
              child: Text('No data for displaying'),
            );
          } else if (state is RecipeListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RecipeListLoaded) {
            Size size = MediaQuery.of(context).size;
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: size.height * 0.26,
                ),
                itemCount: state.recipeList.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return AnimationConfiguration.staggeredGrid(
                      columnCount: 2,
                      position: index,
                      duration: const Duration(milliseconds: 500),
                      child: FadeInAnimation(
                          duration: const Duration(milliseconds: 500),
                          child: cardRecipe(state.recipeList[index], size)));
                });
          } else if (state is RecipeListError) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget cardRecipe(RecipeList recipeList, Size size) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      onTap: () {
        BlocProvider.of<RecipeListBloc>(context).add(OpenRecipeDetailEvent(
            idMeal: recipeList.idMeal,
            mealName: recipeList.strMeal,
            buildContext: context));
      },
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: recipeList.strThumb,
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
            recipeList.strMeal,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  StreamBuilder<List<String>> _favouriteButton(RecipeList recipeList) {
    return StreamBuilder<List<String>>(
        stream: BlocProvider.of<RecipeListBloc>(context).streamFavRecipeId(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool isFav = (snapshot.data?.contains(recipeList.idMeal) ?? false);
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                onTap: () {
                  BlocProvider.of<RecipeListBloc>(context).add(
                    SetFavouriteRecipeListEvent(idMeal: recipeList.idMeal,isFav: isFav),
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
