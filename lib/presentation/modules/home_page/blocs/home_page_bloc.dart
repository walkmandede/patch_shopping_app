import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:patch_shopping_app/core/common/app_enums.dart';
import 'package:patch_shopping_app/core/common/app_functions.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageEvent>((event, emit) async {
      if (event is HomePageInitLoadEvent) {
        //initLoad
        emit(HomePageSuccess(
            selectedTab: EnumHomePageTabs.discover,
            pageController: PageController()));
      } else if (event is HomePageOnClickEachTabEvent) {
        if (state is HomePageSuccess) {
          final successState = state as HomePageSuccess;
          final newIndex = EnumHomePageTabs.values.indexOf(event.selectedTab);
          final oldIndex =
              EnumHomePageTabs.values.indexOf(successState.selectedTab);
          if (newIndex != oldIndex) {
            await successState.pageController.animateToPage(newIndex,
                duration: const Duration(milliseconds: 350),
                curve: Curves.linear);
          }
          emit(successState.copyWith(selectedTab: event.selectedTab));
        }
      }
    });
  }
}
