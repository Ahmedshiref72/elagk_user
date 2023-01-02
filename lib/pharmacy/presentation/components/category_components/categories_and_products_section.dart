
import 'dart:developer';

import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_departments.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_products.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_products_bar.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/default_network_image_widget.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:fancy_cart/fancy_cart.dart';
import 'package:flutter/material.dart';
import '../../../../shared/components/second_appBar.dart';

class CategoriesAndProductsSection extends StatelessWidget {
  const CategoriesAndProductsSection({Key? key, required this.firstCategoryName})
      : super(key: key);

  final String firstCategoryName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PharmacyProductsBar(),
        SizedBox(height: mediaQueryWidth(context) / AppSize.s30),
        // categories & products.
       const PharmacyCategories(),
        SizedBox(height: mediaQueryWidth(context) / AppSize.s15),
        PharmacyProducts(
          firstCategoryName: firstCategoryName,
        ),
        AddToCartButton(
          actionAfterAdding: () {
            log("item added", name: "item added");
          },
          cartModel: CartItem(
              id: DateTime.now().millisecondsSinceEpoch,
              name: 'Test',
              price: 100,
              image: ""),
          child: Container(
            height: 50,
            margin: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Text(
                "Add to cart",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),


      ],
    );
  }
}
