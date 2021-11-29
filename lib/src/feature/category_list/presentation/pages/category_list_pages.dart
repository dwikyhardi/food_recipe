import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_recipe/src/core/widget/favourite_appbar_button.dart';
import 'package:food_recipe/src/feature/category_list/presentation/bloc/category_list_bloc.dart';

class CategoryListPages extends StatefulWidget {
  static const routeName = '/';

  const CategoryListPages({Key? key}) : super(key: key);

  @override
  State<CategoryListPages> createState() => _CategoryListPagesState();
}

class _CategoryListPagesState extends State<CategoryListPages> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<CategoryListBloc>(context)
        .add(const GetCategoryListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Category List'),
        actions: [
          Padding(
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
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<CategoryListBloc, CategoryListState>(
      builder: (context, state) {
        if (state is CategoryListEmpty) {
          return const SizedBox();
        } else if (state is CategoryListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryListLoaded) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3 / 1),
              itemCount: state.categoryList.category.length,
              itemBuilder: (BuildContext buildContext, int index) {
                var data = state.categoryList.category[index];
                return AnimationConfiguration.staggeredGrid(
                  columnCount: 2,
                  position: index,
                  duration: const Duration(milliseconds: 500),
                  child: FadeInAnimation(
                    duration: const Duration(milliseconds: 500),
                    child: ListTile(
                      onTap: () {
                        BlocProvider.of<CategoryListBloc>(context).add(
                          OpenRecipeListEvent(
                            categoryName: data.strCategory,
                            buildContext: buildContext,
                          ),
                        );
                      },
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      title: Text(data.strCategory),
                      isThreeLine: false,
                      dense: false,
                      trailing: const Icon(
                        Icons.chevron_right_rounded,
                      ),
                    ),
                  ),
                );
              });
        } else if (state is CategoryListError) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
