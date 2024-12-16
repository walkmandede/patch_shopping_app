part of 'discover_page_bloc.dart';

@immutable
sealed class DiscoverPageEvent {}

class DiscoverPageInitLoadEvent extends DiscoverPageEvent{}

class DiscoverOnProductSortingEvent extends DiscoverPageEvent{
  final EnumDiscoverSortingOrder? enumDiscoverSortingOrder;

  DiscoverOnProductSortingEvent({
    required this.enumDiscoverSortingOrder
  });

}

class DiscoverPageOnClickEachCategoryEvent extends DiscoverPageEvent{
  final CategoryModel selectedCategory;

  DiscoverPageOnClickEachCategoryEvent({
    required this.selectedCategory,
  });

}

class DiscoverPageSearchEvent extends DiscoverPageEvent{
  final String query;

  DiscoverPageSearchEvent({
    required this.query,
  });

}


