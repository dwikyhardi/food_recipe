import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/src/feature/category_list/presentation/bloc/category_list_bloc.dart';

class FavouriteAppbarButton extends StatelessWidget {
  const FavouriteAppbarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () {
          BlocProvider.of<CategoryListBloc>(context)
              .add(OpenFavouriteRecipeListEvent(buildContext: context));
        },
        child: const Icon(
          Icons.favorite,
          color: CupertinoColors.inactiveGray,
        ),
      ),
    );
  }
}
