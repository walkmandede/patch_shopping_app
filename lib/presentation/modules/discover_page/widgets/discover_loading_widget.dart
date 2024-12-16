import 'package:flutter/cupertino.dart';
import 'package:patch_shopping_app/core/common/app_constants.dart';

class DiscoverLoadingWidget extends StatelessWidget {
  const DiscoverLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppConstants.basePaddingL),
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
