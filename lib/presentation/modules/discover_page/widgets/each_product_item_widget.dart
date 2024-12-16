import 'package:flutter/material.dart';
import 'package:patch_shopping_app/core/common/app_constants.dart';
import 'package:patch_shopping_app/core/common/app_extensions.dart';
import 'package:patch_shopping_app/data/models/m_product_model.dart';

class EachProductItemWidget extends StatelessWidget {
  final ProductModel productModel;
  const EachProductItemWidget({super.key,required this.productModel});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: LayoutBuilder(
        builder: (a1, c1) {
          return DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConstants.baseBorderRadius),
              border: Border.all(
                color: Theme.of(context).inputDecorationTheme.hintStyle!.color!,
                width: 0.5
              )
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: c1.maxWidth * 0.05,
                vertical: c1.maxHeight * 0.05
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 137,
                    child: Image.network(
                      productModel.image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(Icons.image_not_supported_rounded),
                        );
                      },
                    ),
                  ),
                  (c1.maxHeight * 0.05).heightBox(),
                  Expanded(
                    flex: 66,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productModel.title,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        (c1.maxHeight * 0.0125).heightBox(),
                        Expanded(
                          child: Text(
                            productModel.description,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 10,
                              color: Theme.of(context).unselectedWidgetColor
                            ),
                          ),
                        ),
                        (c1.maxHeight * 0.0125).heightBox(),
                        Text(
                          "\$${productModel.price}",
                          style: TextStyle(
                            fontSize: 10,
                            color: Theme.of(context).textTheme.bodyLarge!.color
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
