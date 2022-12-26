import 'package:flutter/material.dart';

import '../../auth/presentation/components/screen_background.dart';
import '../../drawer/presentation/components/fixed_appbar_widget.dart';
import '../../home/presentation/components/home_app_bar.dart';
import '../../home/presentation/components/search_widget.dart';
import '../../shared/global/app_colors.dart';
import '../../shared/utils/app_assets.dart';
import '../../shared/utils/app_strings.dart';
import '../../shared/utils/app_values.dart';
import '../../shared/utils/default_network_image_widget.dart';
import '../categories_and_products_section.dart';
import '../pharmacy_info.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: ScreenBackground(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppPadding.p20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: AppSize.s180,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      // Pharmacy photo
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          decoration:  BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                AppSize.s8,
                              ),
                              gradient:const LinearGradient(
                                  begin:Alignment.topRight ,
                                  end:Alignment.bottomRight ,
                                  colors:
                                  [
                                    Color(0xff137e8f),
                                    Color(0xff059053),
                                  ])
                          ),
                          width: mediaQueryWidth(context),
                          height: AppSize.s170,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: AppSize.s35,
                              ),
                              const Center(
                                child: Text(
                                  AppStrings.searchFor,
                                  style: TextStyle(
                                    fontSize: 25,color: Colors.white
                                  ),
                                ),
                              ),
                              SearchWidget(),
                            ],
                          ),


                        ),
                      ),

                      // Pharmacy information

                    ],
                  ),
                ),
                SizedBox(
                    height: mediaQueryHeight(context) / AppSize.s40),
                CategoriesAndProductsSection(
                  firstCategoryName: "categoryName",
                ),
              ],

            ),


          ),
        ),
      ),
    );
  }
}
