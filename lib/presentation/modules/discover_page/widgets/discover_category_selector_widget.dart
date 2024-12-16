import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patch_shopping_app/core/common/app_assets.dart';
import 'package:patch_shopping_app/core/common/app_constants.dart';
import 'package:patch_shopping_app/core/common/app_extensions.dart';
import 'package:patch_shopping_app/core/common/app_functions.dart';
import 'package:patch_shopping_app/data/models/m_category_model.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/bloc/discover_page_bloc.dart';

class DiscoveryCategorySelectorWidget extends StatelessWidget {
  const DiscoveryCategorySelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(AppConstants.basePadding),
            child: Text(
              "Choose from any category",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18
              ),
            ),
          ),
          LayoutBuilder(
            builder: (a1,c1) {
              return BlocSelector<DiscoverPageBloc,DiscoverPageState,List<CategoryModel>>(
                selector: (state) => (state as DiscoverPageSuccess).allCategories,
                builder: (context, allCategories) {
                  return BlocSelector<DiscoverPageBloc,DiscoverPageState,CategoryModel?>(
                    selector: (state) => (state as DiscoverPageSuccess).selectedCategory,
                    builder: (context, selectedCategory) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: AppConstants.basePadding,
                            ),
                            ...allCategories.map((each) {
                              //hardCode for category images and label
                              String imagePath = "";
                              String label = "";
                              final xSelected = selectedCategory == each;
                              switch(each.name){
                                case "electronics" :
                                  imagePath = AppAssets.electricImage;
                                  label = "Electronics";
                                  break;
                                case "jewelery" :
                                  imagePath = AppAssets.jewelryImage;
                                  label = "Jewelery";
                                  break;
                                case "men's clothing" :
                                  imagePath = AppAssets.menWareImage;
                                  label = "Men's Wear";
                                  break;
                                case "women's clothing" :
                                  imagePath = AppAssets.womenWearImage;
                                  label = "Women's Wear";
                                  break;
                              }
                              return InkWell(
                                onTap: () {
                                  final discoverPageBloc = context.read<DiscoverPageBloc>();
                                  discoverPageBloc.add(DiscoverPageOnClickEachCategoryEvent(selectedCategory: each));
                                },
                                splashFactory: NoSplash.splashFactory,
                                child: SizedBox(
                                  width: c1.maxWidth * 0.25,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      right: c1.maxWidth * 0.05
                                    ),
                                    child: Column(
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1,
                                          child: LayoutBuilder(
                                            builder: (a2, c2) {
                                              return SizedBox.expand(
                                                child: DecoratedBox(
                                                  decoration: !xSelected?BoxDecoration():BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xff4CBACC),
                                                        Color(0xff77D28B),
                                                      ],
                                                      begin: Alignment.topCenter,
                                                      end: Alignment.bottomCenter
                                                    )
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(
                                                      c2.maxWidth * 0.05
                                                    ),
                                                    child: SizedBox.expand(
                                                      child: DecoratedBox(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            shape: BoxShape.circle
                                                        ),
                                                        child: Padding(
                                                          padding: EdgeInsets.all(
                                                              c2.maxWidth * 0.025
                                                          ),
                                                          child: SizedBox.expand(
                                                            child: DecoratedBox(
                                                              decoration: BoxDecoration(
                                                                  color: Colors.black,
                                                                  shape: BoxShape.circle
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(100000),
                                                                child: Image.asset(
                                                                  imagePath,
                                                                  fit: BoxFit.cover,
                                                                  errorBuilder: (context, error, stackTrace) {
                                                                    return Center(
                                                                      child: Icon(Icons.image_not_supported_rounded),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                            label,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },).toList()
                          ],
                        ),
                      );
                    },
                  );
                },
              );
            }
          ),
        ],
      ),
    );
  }
}
