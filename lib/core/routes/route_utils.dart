import 'package:patch_shopping_app/main.dart';

import '../../presentation/modules/home_page/home_page.dart';


class RouteUtils{

  static const String homePage = "/homePage";

  final routes = {
    homePage: (context) => const HomePage(),
  };

}