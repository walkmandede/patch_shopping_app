
class ProductModel{

  String id;
  String title;
  String description;
  double price;
  double ratingValue;
  int rateCount;
  String image;
  String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.rateCount,
    required this.category,
    required this.ratingValue,
  });

  factory ProductModel.fromApiResponse({required Map<String,dynamic> data}){
    return ProductModel(
      id: data["id"].toString(),
      title: data["title"].toString(),
      description: data["description"].toString(),
      image: data["image"].toString(),
      rateCount: data["rating"]==null?0:int.tryParse(data["rating"]["count"].toString())??0,
      ratingValue: data["rating"]==null?0:double.tryParse(data["rating"]["rate"].toString())??0,
      category: data["category"].toString(),
      price: double.tryParse(data["price"].toString())??0
    );
  }


}