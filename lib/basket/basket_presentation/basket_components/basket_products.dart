import 'package:elagk/basket/basket_presentation/basket_controller/basket_cubit.dart';
import 'package:flutter/cupertino.dart';

import '../../../../shared/utils/app_values.dart';
import 'basket_items_widget.dart';


class BasketProducts extends StatefulWidget {
  const BasketProducts({Key? key, required this.firstCategoryName}) : super(key: key);

  final String firstCategoryName;


  @override
  State<BasketProducts> createState() => _BasketProductsState();
}

class _BasketProductsState extends State<BasketProducts> {
  @override


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: BasketCubit.get(context).baskets.length,
      itemBuilder: (BuildContext context, int index) {
        return  BasketPharmacy(
          categoriesName: BasketCubit.get(context).baskets[index].productName!,
         Basket: BasketCubit.get(context).baskets[index].price!,
          imageSrc: BasketCubit.get(context).baskets[index].imageUrl!,

        );
      },
    );
  }
}
