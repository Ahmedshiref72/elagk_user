import 'package:elagk/pharmacy/pharmacy_info.dart';
import 'package:flutter/material.dart';
import '../auth/presentation/components/screen_background.dart';
import '../home/presentation/components/pharmacies_widget.dart';
import '../shared/global/app_colors.dart';
import '../shared/utils/app_assets.dart';
import '../shared/utils/app_routes.dart';
import '../shared/utils/app_strings.dart';
import '../shared/utils/app_values.dart';
import '../shared/utils/default_network_image_widget.dart';
import '../shared/utils/fixed_appbar_widget.dart';
import '../shared/utils/navigation.dart';
import 'catgories_widget.dart';
import 'item.dart';

class PharmacyScreen extends StatelessWidget {


  const PharmacyScreen({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        appBar: fixedAppBar(
          context: context,
          title: " pharmacyName ",
        ),
        body: ScreenBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppPadding.p10),
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
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: mediaQueryWidth(context),
                          height: AppSize.s170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              AppSize.s8,
                            ),
                          ),
                          child: const DefaultNetworkImage(
                            imageSrc: 'assets/images/profile/download (4).png',
                            height: double.infinity,
                            width: double.infinity,
                            padding: AppPadding.p0,
                          ),
                        ),
                      ),
                      // Pharmacy information
                      const PharmacyInformation(),
                    ],
                  ),
                ),
                SizedBox(
                    height: mediaQueryHeight(context) / AppSize.s10),
               
                Row(children:[
                  HomeScreenItem(
                     image: 'assets/images/make-up.jpg', name: AppStrings.cost,),
                  SizedBox(
                      width: mediaQueryHeight(context) / AppSize.s18),
                  HomeScreenItem(
                    image: 'assets/images/medicine.jpg',
                      name:AppStrings.medicine),

                ] ),
                SizedBox(
                    height: mediaQueryHeight(context) / AppSize.si6),
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
                        children: [
                          SizedBox(width: mediaQueryWidth(context) / AppSize.s5),
                          Text(AppStrings.prescriptionAndDeliverPrice,
                              style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          SizedBox(width: mediaQueryWidth(context) / AppSize.s20),
                          Image.asset(
                              ImageAssets.importImage,
                            color: AppColors.shadow,
                          width:  AppSize.s50,),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


