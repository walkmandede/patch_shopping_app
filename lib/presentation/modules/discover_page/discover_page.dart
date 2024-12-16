import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patch_shopping_app/core/common/app_constants.dart';
import 'package:patch_shopping_app/core/common/app_enums.dart';
import 'package:patch_shopping_app/core/common/app_extensions.dart';
import 'package:patch_shopping_app/core/common/app_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patch_shopping_app/data/repositories/rp_category_repo.dart';
import 'package:patch_shopping_app/data/repositories/rp_product_repo.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/bloc/discover_page_bloc.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/widgets/discover_category_selector_widget.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/widgets/discover_loading_widget.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/widgets/discover_product_display_page.dart';
import 'package:patch_shopping_app/presentation/modules/home_page/blocs/home_page_bloc.dart';

import 'widgets/discover_search_bar_widget.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = DiscoverPageBloc(
          categoryRepo: CategoryRepo(),
          productRepo: ProductRepo(),
        );
        bloc.add(DiscoverPageInitLoadEvent());
        return bloc;
      },
      child: BlocBuilder<DiscoverPageBloc,DiscoverPageState>(
        builder: (context, state) {
          final discoverPageBloc = context.read<DiscoverPageBloc>();
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 0,
              backgroundColor: Theme.of(context).primaryColor,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: SizedBox.expand(
              child: Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                          height: AppConstants.baseButtonHeightL,
                          width: double.infinity,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor
                            ),
                          )
                      ),
                      SizedBox(
                          height: AppConstants.baseButtonHeightL*0.5,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor
                            ),
                          )
                      ),
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if(state is DiscoverPageInitial){
                              return DiscoverLoadingWidget();
                            }
                            if(state is DiscoverPageFailure){
                              return Center(
                                child: Text(
                                  "Sorry! Something went wrong in fetching data!\nPlease try again!",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }
                            else if(state is DiscoverPageSuccess){
                              return SingleChildScrollView(
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    DiscoveryCategorySelectorWidget(),
                                    DiscoverProductDisplayPage()
                                  ],
                                ),
                              );
                            }
                            else{
                              //default case
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                  Transform.translate(
                    offset: Offset(0, (AppConstants.baseButtonHeightL * 0.5)),
                    child: DiscoverSearchBarWidget(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}
