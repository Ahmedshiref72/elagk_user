import 'dart:developer';
import 'package:elagk/shared/utils/app__fonts.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:fancy_cart/fancy_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pharmacy_controllers/orderByPerscripiyion_controller/order_by_perscripiyion_cubit.dart';
import '../../pharmacy_controllers/orderByPerscripiyion_controller/order_by_perscripiyion_state.dart';

class ProductItemPharmacy extends StatelessWidget {

  const ProductItemPharmacy({
    Key? key,
    required this.categoriesName,
    required this.categoriesPrice,
    required this.imageSrc,
    required this.onTap,
  }) : super(key: key);

  final String categoriesName;
  final String categoriesPrice;
  final String imageSrc;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderByPerscripiyionCubit,OrderByPerscripiyionStates>(
      listener: (context,state){},
      builder: (context,state){
        return  InkWell(
          onLongPress: onTap,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              height: AppSize.s170,
              width: AppSize.s110,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.s15),
              ),
              child: Column(
                children: [
                  Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSize.s15),
                        child:  Image(
                          image: AssetImage(
                            "assets/images/medicine.jpg",
                          ),
                          width: double.infinity,
                          height:AppSize.s70,
                        ),

                      )),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s120),
                  Text(
                    categoriesName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s150),
                  Text(
                    categoriesPrice,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: FontSize.s11, fontWeight: FontWeightManager.light),
                  ),
                  SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
                  state is PickImageSuccessState ?
                  AddToCartButton(
                    actionAfterAdding: () {
                      print('object');
                      log("item added", name: "item added");
                    },
                    cartModel: CartItem(
                        id: DateTime.now().millisecondsSinceEpoch,
                        name: categoriesName,
                        price:10.0 ,
                        image: OrderByPerscripiyionCubit.get(context).imagePath!),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient:const LinearGradient(

                              begin:Alignment.topRight ,
                              end:Alignment.bottomRight,
                              colors:
                              [

                                Color(0xff1d938c),
                                Color(0xff1c72b5),
                              ])
                      ),
                      width: AppSize.s110,
                      height: AppSize.s30,
                      child: const Center(
                        child: Text(
                          "اضف الي العربة",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ):SizedBox(),


                ],
              ),
            ),
          ),
        );
      },


    );
  }
}
