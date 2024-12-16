import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:patch_shopping_app/core/common/app_enums.dart';
import 'package:patch_shopping_app/core/common/app_extensions.dart';
import 'package:patch_shopping_app/core/common/app_functions.dart';
import 'package:patch_shopping_app/data/models/m_category_model.dart';
import 'package:patch_shopping_app/data/models/m_product_model.dart';
import 'package:patch_shopping_app/data/repositories/rp_category_repo.dart';
import 'package:patch_shopping_app/data/repositories/rp_product_repo.dart';

part 'discover_page_event.dart';
part 'discover_page_state.dart';

class DiscoverPageBloc extends Bloc<DiscoverPageEvent, DiscoverPageState> {
  final CategoryRepo categoryRepo;
  final ProductRepo productRepo;
  DiscoverPageBloc({
    required this.categoryRepo,
    required this.productRepo
  }) : super(DiscoverPageInitial()) {
    on<DiscoverPageEvent>((event, emit) async{
      if(event is DiscoverPageInitLoadEvent){
        if(state is DiscoverPageInitial){
          final categoryResult = await categoryRepo.fetchAllCategories();

          if(categoryResult.item1!=null){
            //category fail
            emit(DiscoverPageFailure(message: categoryResult.item1.toString()));
          }
          else{
            //category success
            final allProductResult = await productRepo.fetchAllProduct();
            if(allProductResult.item1!=null){
              //product fail
              emit(DiscoverPageFailure(message: allProductResult.item1.toString()));
            }
            else{
              //product success
              emit(
                DiscoverPageSuccess(
                  selectedCategory: null,
                  allCategories: categoryResult.item2??[],
                  shownProduct: allProductResult.item2??[],
                  allProducts: allProductResult.item2??[],
                  selectedSortingOrder: null
                )
              );
            }
          }
        }
      }
      else if(event is DiscoverPageOnClickEachCategoryEvent){
        final successState = state as DiscoverPageSuccess;

        emit(successState.copyWith(
          xProductFetching: true,
          selectedCategory: event.selectedCategory,
          selectedSortingOrder: successState.selectedSortingOrder
        ));

        final apiResult = await productRepo.fetchCategorizedModel(category: event.selectedCategory);

        if(apiResult.item1!=null){
          //failure
          emit(
              successState.copyWith(
                  selectedCategory: event.selectedCategory,
                  xProductFetching: false,
                  selectedSortingOrder: null,
                  allProducts: []
              )
          );
        }
        else{
          //success
          emit(
              successState.copyWith(
                  xProductFetching: false,
                  selectedCategory: event.selectedCategory,
                  selectedSortingOrder: null,
                  shownProducts: apiResult.item2,
              )
          );
          superPrint(successState.selectedSortingOrder,title: "Blo");
        }


      }
      else if(event is DiscoverOnProductSortingEvent){
        final successState = state as DiscoverPageSuccess;

        if(event.enumDiscoverSortingOrder!=null){

          final result = [...successState.shownProduct];
          result.sort((a, b) {
            if(event.enumDiscoverSortingOrder == EnumDiscoverSortingOrder.lowestFirst){
              return a.price.compareTo(b.price);
            }
            else{
              return b.price.compareTo(a.price);
            }
          },);
          emit(
              successState.copyWith(
                shownProducts: result,
                selectedSortingOrder: event.enumDiscoverSortingOrder,
                selectedCategory: successState.selectedCategory
              )
          );
        }

      }
      else if(event is DiscoverPageSearchEvent){
        if(state is DiscoverPageSuccess){
          final successState = state as DiscoverPageSuccess;
          String trimmedQuery = event.query.superTrim();
          List<ProductModel> result = [];
          for(final each in successState.allProducts){
            final trimmedEach = each.title.superTrim();
            if(trimmedEach.contains(trimmedQuery) || trimmedQuery.contains(trimmedEach)){
              result.add(each);
            }
          }
          emit(
            successState.copyWith(
              shownProducts: result,
              selectedCategory: null,
              selectedSortingOrder: null
            )
          );
        }
      }
    });
  }
}
