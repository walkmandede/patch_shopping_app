import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patch_shopping_app/core/common/app_enums.dart';
import 'package:patch_shopping_app/core/common/app_functions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patch_shopping_app/presentation/modules/home_page/blocs/home_page_bloc.dart';

import '../discover_page/discover_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = HomePageBloc();
        bloc.add(HomePageInitLoadEvent());
        return bloc;
      },
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          final homePageBloc = context.read<HomePageBloc>();
          if (state is HomePageInitial) {
            //when page is loaded >> trigger HomePageBloc's InitLoad event
            return Material(
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          } else if (state is HomePageFailure) {
            //this state does not exists in real
            return const SizedBox.shrink();
          } else if (state is HomePageSuccess) {
            //success page
            return Scaffold(
              body: BlocSelector<HomePageBloc, HomePageState, EnumHomePageTabs>(
                selector: (state) => (state as HomePageSuccess).selectedTab,
                builder: (context, selectedTab) {
                  return PageView.builder(
                    controller: state.pageController,
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return const DiscoverPage();
                        case 1:
                          return Center(
                            child: Text(selectedTab.label),
                          );
                        case 2:
                          return Center(
                            child: Text(selectedTab.label),
                          );
                        case 3:
                          return Center(
                            child: Text(selectedTab.label),
                          );
                        case 4:
                          return Center(
                            child: Text(selectedTab.label),
                          );
                      }
                    },
                  );
                },
              ),
              bottomNavigationBar:
                  BlocSelector<HomePageBloc, HomePageState, EnumHomePageTabs>(
                selector: (state) => (state as HomePageSuccess).selectedTab,
                builder: (context, selectedTab) {
                  final selectedPageTabIndex =
                      EnumHomePageTabs.values.indexOf(selectedTab);
                  return BottomNavigationBar(
                    onTap: (value) {
                      try {
                        final newTab = EnumHomePageTabs.values[value];
                        homePageBloc.add(
                            HomePageOnClickEachTabEvent(selectedTab: newTab));
                      } catch (_) {
                        superPrint("error");
                      }
                    },
                    currentIndex: selectedPageTabIndex,
                    backgroundColor: Colors.red,
                    elevation: 10,
                    enableFeedback: true,
                    selectedItemColor: Theme.of(context).primaryColor,
                    unselectedItemColor:
                        Theme.of(context).unselectedWidgetColor,
                    showUnselectedLabels: true,
                    showSelectedLabels: true,
                    items: EnumHomePageTabs.values.map(
                      (eachTab) {
                        return BottomNavigationBarItem(
                            icon: Icon(eachTab.iconData),
                            label: eachTab.label,
                            activeIcon: Icon(eachTab.iconData));
                      },
                    ).toList(),
                  );
                },
              ),
            );
          } else {
            //default case
            return const SizedBox.expand();
          }
        },
      ),
    );
  }
}
