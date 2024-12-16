import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patch_shopping_app/core/common/app_constants.dart';
import 'package:patch_shopping_app/presentation/modules/discover_page/discover_page.dart';

import '../bloc/discover_page_bloc.dart';

class DiscoverSearchBarWidget extends StatelessWidget {
  const DiscoverSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final discoverBloc = context.read<DiscoverPageBloc>();
    TextEditingController txtSearch = TextEditingController();
    return SizedBox(
      width: double.infinity,
      height: AppConstants.baseButtonHeightL,
      child: LayoutBuilder(
        builder: (a1, c1) {
          return Card(
            margin: EdgeInsets.symmetric(
              horizontal: c1.maxWidth * 0.05,
            ),
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: c1.maxWidth * 0.05
                ),
                child: Row(
                  children: [
                    Icon(Icons.search_rounded,color: Theme.of(context).disabledColor,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: "What are you looking for?",
                        ),
                        onChanged: (value) {
                          discoverBloc.add(DiscoverPageSearchEvent(query: value));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
