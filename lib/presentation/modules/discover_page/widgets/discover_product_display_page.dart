import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patch_shopping_app/core/common/app_assets.dart';
import 'package:patch_shopping_app/core/common/app_constants.dart';
import 'package:patch_shopping_app/core/common/app_enums.dart';
import 'package:patch_shopping_app/core/common/app_extensions.dart';
import 'package:patch_shopping_app/core/common/app_functions.dart';
import 'package:patch_shopping_app/data/models/m_category_model.dart';
import 'package:patch_shopping_app/data/models/m_product_model.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/bloc/discover_page_bloc.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/widgets/discover_loading_widget.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/widgets/each_product_item_widget.dart';

class DiscoverProductDisplayPage extends StatelessWidget {
  const DiscoverProductDisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocSelector<DiscoverPageBloc,DiscoverPageState,bool>(
        selector: (state) => (state as DiscoverPageSuccess).xProductFetching,
        builder: (context, xProductFetching) {
          if(xProductFetching){
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstants.basePadding,
                vertical: AppConstants.basePaddingL
              ),
              child: DiscoverLoadingWidget(),
            );
          }
          else{
            return BlocSelector<DiscoverPageBloc,DiscoverPageState,List<ProductModel>>(
              selector: (state) => (state as DiscoverPageSuccess).shownProduct,
              builder: (context, allProducts) {
                if(allProducts.isEmpty){
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppConstants.basePaddingL),
                      child: Text(
                        "No product!",
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.errorContainer
                        ),
                      ),
                    ),
                  );
                }
                else{
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.basePadding,
                        vertical: AppConstants.basePadding
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${allProducts.length} products to choose from",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),
                        ),
                        (10.heightBox()),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            spacing: 10,
                            children: [
                              ...EnumDiscoverSortingOrder.values.map((each) {
                                return BlocSelector<DiscoverPageBloc,DiscoverPageState,EnumDiscoverSortingOrder?>(
                                  selector: (state) => (state as DiscoverPageSuccess).selectedSortingOrder,
                                  builder: (context, selectedSortingOrder) {
                                    bool xSelected = selectedSortingOrder == each;
                                    return SizedBox(
                                      height: AppConstants.baseButtonHeightMS,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          final discoverBloc = context.read<DiscoverPageBloc>();
                                          discoverBloc.add(DiscoverOnProductSortingEvent(enumDiscoverSortingOrder: each));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            elevation: 0,
                                            backgroundColor: xSelected?Theme.of(context).primaryColor:Theme.of(context).disabledColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(AppConstants.baseBorderRadiusS),
                                            )
                                        ),
                                        child: Text(each.label),
                                      ),
                                    );
                                  },
                                );
                              },)
                            ],
                          ),
                        ),
                        (10.heightBox()),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 170/210, //figma aspect ratio,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10
                          ),
                          shrinkWrap: true,
                          itemCount: allProducts.length,
                          itemBuilder: (context, index) {
                            final model = allProducts[index];
                            return EachProductItemWidget(productModel: model);
                          },
                        ),
                        (10.heightBox()),
                      ],
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}
