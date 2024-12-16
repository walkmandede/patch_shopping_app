part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class HomePageInitLoadEvent extends HomePageEvent{

}

class HomePageOnClickEachTabEvent extends HomePageEvent{
  final EnumHomePageTabs selectedTab;

  HomePageOnClickEachTabEvent({
    required this.selectedTab,
  });

}