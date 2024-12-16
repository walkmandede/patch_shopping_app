part of 'home_page_bloc.dart';

@immutable
sealed class HomePageState {}

final class HomePageInitial extends HomePageState {}

final class HomePageSuccess extends HomePageState{

  final EnumHomePageTabs selectedTab;
  final PageController pageController;

  HomePageSuccess({
    required this.selectedTab,
    required this.pageController,
  });


  HomePageSuccess copyWith({
    EnumHomePageTabs? selectedTab,
  }){
    return HomePageSuccess(
      selectedTab: selectedTab??this.selectedTab,
      pageController: pageController
    );
  }

}

final class HomePageFailure extends HomePageState {
  final String message;

  HomePageFailure({
    required this.message
  });


}
