import 'dart:convert';
import 'package:patch_shopping_app/data/models/m_category_model.dart';
import 'package:http/http.dart' as http;
import 'package:patch_shopping_app/networks/api_utils.dart';
import 'package:tuple/tuple.dart';

class CategoryRepo{

  Future<Tuple2<Exception?,List<CategoryModel>?>> fetchAllCategories() async{
    try{
      List<CategoryModel> result = [];
      final httpResponse = await http.get(
        Uri.parse(ApiUtils.getAllCategoriesEndPoint())
      );
      Iterable rawCategories = jsonDecode(httpResponse.body);
      result.addAll(rawCategories.map((each) => CategoryModel(name: each),).toList());
      return Tuple2(null, result);
    }
    catch(e1){
      return Tuple2(Exception(e1.toString()), null);
    }
  }

}