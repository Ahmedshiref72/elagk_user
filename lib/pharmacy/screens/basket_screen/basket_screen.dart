import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../auth/presentation/components/screen_background.dart';
import '../../../drawer/presentation/components/points_components/points_widget.dart';
import '../../../home/presentation/components/app_bar_basket_icon.dart';
import '../../../shared/global/app_colors.dart';
import '../../../shared/utils/app_routes.dart';
import '../../../shared/utils/app_strings.dart';
import '../../../shared/utils/app_values.dart';
import '../../../shared/utils/navigation.dart';
import '../../components/basket_components/basket_appBar.dart';
import '../../components/basket_components/basket_widget.dart';
import '../../components/pharmacy_components/pharmacy_appBar.dart';

class basketScreen extends StatelessWidget {
  const basketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: BasketAppBar(
            context: context,
            title:AppStrings.basket,

          ),
          backgroundColor: AppColors.offWhite,
          body: ScreenBackground(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                children: [
                  const BasketSection(
                    firstCategoryName: "categoryName",
                  ),

                  SizedBox(
                      width: double.infinity,
                      height: AppSize.s60,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppPadding.p15),
                        ),
                        onPressed: () => {

                        },
                        color:AppColors.offBlue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Text(AppStrings.buy,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ],
                        ),
                      )),
                ],

              ),


            ),
          ),
        ),
      ),
    );
  }
}
