import 'package:flutter/material.dart';

enum EnumHomePageTabs{
  discover(label: "Discover",iconData: Icons.search_rounded),
  cart(label: "Cart",iconData: Icons.shopping_bag_outlined),
  sell(label: "Sell",iconData: Icons.add_circle_outline_rounded),
  inbox(label: "Inbox",iconData: Icons.inbox_rounded),
  profile(label: "Profile",iconData: Icons.person_outline_rounded);
  final String label;
  final IconData iconData;

  const EnumHomePageTabs({required this.label,required this.iconData});
}

enum EnumDiscoverSortingOrder{
  lowestFirst(label: "Lowest price first"),
  highestFirst(label: "Highest price first");
  final String label;

  const EnumDiscoverSortingOrder({required this.label});
}