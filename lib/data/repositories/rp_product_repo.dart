import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:patch_shopping_app/data/models/m_product_model.dart';
import 'package:tuple/tuple.dart';
import '../../networks/api_utils.dart';
import '../models/m_category_model.dart';

class ProductRepo{

  Future<Tuple2<Exception?,List<ProductModel>?>> fetchAllProduct() async{
    try{
      List<ProductModel> result = [];
      final httpResponse = await http.get(
          Uri.parse(ApiUtils.getAllProductsByLimitEndPoint(limit: 50))
      );
      Iterable rawProducts = jsonDecode(httpResponse.body);
      result.addAll(rawProducts.map((each) => ProductModel.fromApiResponse(data: each),).toList());
      return Tuple2(null, result);
    }
    catch(e1){
      return Tuple2(Exception(e1), null);
    }
  }

  Future<Tuple2<Exception?,List<ProductModel>?>> fetchCategorizedModel({required CategoryModel category}) async{
    try{
      List<ProductModel> result = [];
      final httpResponse = await http.get(
          Uri.parse(ApiUtils.getProductByCategoryNameEndPoint(categoryName: category.name))
      );
      Iterable rawProducts = jsonDecode(httpResponse.body);
      result.addAll(rawProducts.map((each) => ProductModel.fromApiResponse(data: each),).toList());
      return Tuple2(null, result);
    }
    catch(e1){
      return Tuple2(Exception(e1), null);
    }
  }

}