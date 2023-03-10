import 'package:elagk/auth/presentation/components/screen_background.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/pharmacy/data/pharmacy_model.dart';
import 'package:elagk/pharmacy/presentation/components/OrderByPrescriptionComponents/OrderByPrescriptionContent.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/categories_and_products_section.dart';
import 'package:elagk/pharmacy/presentation/components/category_components/item.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_cubit.dart';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/pharmacy_producties_controller/pharmacy_producties_state.dart';
import 'package:elagk/shared/components/second_appBar.dart';
import 'package:elagk/pharmacy/presentation/components/pharmacy_components/pharmacy_info.dart';
import 'package:elagk/shared/global/app_colors.dart';
import 'package:elagk/shared/utils/app_assets.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/default_network_image_widget.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../components/category_components/search_categories.dart';


class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({
    Key? key, required this.pharmacyModel
  }) : super(key: key);
  final PharmacyModel pharmacyModel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: SecondAppBar(
            context: context,
            title: pharmacyModel.pharmacyName!,
            onTap: () {
              navigateTo(
                context: context,
                screenRoute: Routes.basketScreen,
              );
            },
            actionWidget: const AppBarBasketIcon(),
          ),

          backgroundColor: AppColors.offWhite,
          body: BlocBuilder<PharmacyProductiesCubit, PharmacyProductiesStates>(
            builder: (context, state) {
              if(PharmacyProductiesCubit.get(context).categories.isNotEmpty)
              return ScreenBackground(
                textDirection: TextDirection.rtl,

                child: SingleChildScrollView(
                  padding: EdgeInsets.all(AppPadding.p20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: AppSize.s200,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // Pharmacy photo
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppSize.s8,
                                    ),
                                    gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomRight,
                                        colors:
                                        [
                                          Color(0xff137e8f),
                                          Color(0xff059053),
                                        ])
                                ),
                                width: mediaQueryWidth(context),
                                height: AppSize.s300,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: AppSize.s35,
                                    ),
                                    const Center(
                                      child: Text(
                                        AppStrings.searchFor,
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                    SearchCategoriesWidget(),
                                  ],
                                ),


                              ),
                            ), // Pharmacy information
                          ],
                        ),
                      ),

                      SizedBox(
                          height: mediaQueryHeight(context) / AppSize.s40),
                      CategoriesAndProductsSection(
                        firstCategoryName: "categoryName",
                        pharmacyId: pharmacyModel.pharmacyId!,
                      ),
                    ],

                  ),


                ),
              );
              else return Center(child:
              CircularProgressIndicator(color: AppColors.primary,),);
            },
          ),
        ),
      ),
    );
  }
}
