import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/src/core/network/launch_another_apps.dart';
import 'package:food_recipe/src/core/widget/favourite_appbar_button.dart';
import 'package:food_recipe/src/di/injection_container.dart';
import 'package:food_recipe/src/feature/recipe_detail/domain/entity/recipe_detail.dart';
import 'package:food_recipe/src/feature/recipe_detail/presentation/bloc/recipe_detail_bloc.dart';

class RecipeDetailPages extends StatefulWidget {
  static const routeName = '/recipe_detail';
  final String idMeal;

  const RecipeDetailPages({Key? key, required this.idMeal}) : super(key: key);

  @override
  _RecipeDetailPagesState createState() => _RecipeDetailPagesState();
}

class _RecipeDetailPagesState extends State<RecipeDetailPages> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RecipeDetailBloc>(context)
        .add(GetRecipeDetailEvent(widget.idMeal));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe'),
        actions: const [
          FavouriteAppbarButton()
        ],
      ),
      body: BlocBuilder<RecipeDetailBloc, RecipeDetailState>(
        builder: (BuildContext buildContext, RecipeDetailState state) {
          if (state is RecipeDetailEmpty) {
            return const Center(
              child: Text('No data for displaying'),
            );
          } else if (state is RecipeDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RecipeDetailLoaded) {
            Size size = MediaQuery.of(context).size;
            return recipeDetailWidget(state.recipeDetail, size);
          } else if (state is RecipeDetailError) {
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

  Widget recipeDetailWidget(RecipeDetail recipeDetail, Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: recipeDetail.strMealThumb ?? '',
              height: size.height * 0.5,
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
          const SizedBox(
            height: 10,
          ),
          Text(
            recipeDetail.strMeal ?? '',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Divider(
            height: 30,
            thickness: 2,
          ),
          ExpansionTile(
            title: const Text(
              'Ingredient',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            children: [
              ingredient(recipeDetail),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 2,
          ),
          ExpansionTile(
            title: const Text(
              'Instruction',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            children: [
              _instruction(recipeDetail),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 2,
          ),
          _youtubeLink(recipeDetail),
        ],
      ),
    );
  }

  Widget _youtubeLink(RecipeDetail recipeDetail) {
    if (recipeDetail.strYoutube?.isNotEmpty ?? false) {
      return ExpansionTile(
        title: const Text(
          'Instruction Video',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
        ),
        trailing: const SizedBox(),
        onExpansionChanged: (isExpanded) async {
          sl<LaunchAnotherApp>()(recipeDetail.strYoutube);
        },
      );
    } else {
      return const SizedBox();
    }
  }

  Padding _instruction(RecipeDetail recipeDetail) {
    List<Widget> widgetList = [];
    recipeDetail.strInstructions?.split('. ').forEach((element) {
      widgetList.add(Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          '$element.',
          textAlign: TextAlign.start,
        ),
      ));
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: widgetList,
      ),
    );
  }

  Widget ingredient(RecipeDetail recipeDetail) {
    List<Widget> ingredientText = [];
    List<Widget> measureText = [];
    recipeDetail.ingredient?.forEach((ingri) {
      if (ingri.isNotEmpty) {
        ingredientText.add(Text(ingri));
      }
    });

    recipeDetail.measure?.forEach((measu) {
      if (measu.isNotEmpty) {
        measureText.add(Text(measu));
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ingredientText,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: measureText,
          )
        ],
      ),
    );
  }
}
