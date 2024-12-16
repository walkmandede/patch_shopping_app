part of 'discover_page_bloc.dart';

@immutable
sealed class DiscoverPageState {}

final class DiscoverPageInitial extends DiscoverPageState {}

final class DiscoverPageDataFetching extends DiscoverPageState {}

final class DiscoverPageSuccess extends DiscoverPageState{

  final List<CategoryModel> allCategories;
  final List<ProductModel> allProducts;
  final List<ProductModel> shownProduct;
  final CategoryModel? selectedCategory;
  final EnumDiscoverSortingOrder? selectedSortingOrder;
  final bool xProductFetching;

  DiscoverPageSuccess({
    required this.allCategories,
    required this.allProducts,
    required this.shownProduct,
    required this.selectedCategory,
    required this.selectedSortingOrder,
    this.xProductFetching = false
  });


  DiscoverPageSuccess copyWith({
    required CategoryModel? selectedCategory,
    List<CategoryModel>? allCategories,
    List<ProductModel>? allProducts,
    List<ProductModel>? shownProducts,
    required EnumDiscoverSortingOrder? selectedSortingOrder,
    bool? xProductFetching
  }){
    return DiscoverPageSuccess(
      shownProduct: shownProducts??this.shownProduct,
      allProducts: allProducts??this.allProducts,
      allCategories: allCategories??this.allCategories,
      selectedCategory: selectedCategory,
      selectedSortingOrder: selectedSortingOrder,
      xProductFetching: xProductFetching??this.xProductFetching
    );
  }

}

final class DiscoverPageFailure extends DiscoverPageState {
  final String message;

  DiscoverPageFailure({
    required this.message
  });


}

