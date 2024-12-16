
class ApiUtils{

  static const String baseUrl = "https://fakestoreapi.com";

  static String getProductByCategoryNameEndPoint({
    required String categoryName,
  }){
    return "$baseUrl/products/category/$categoryName";
  }

  static String getAllCategoriesEndPoint(){
    return "$baseUrl/products/categories";
  }

  static String getAllProductsByLimitEndPoint({
    required int limit,
  }){
    return "$baseUrl/products?limit=$limit";
  }

}