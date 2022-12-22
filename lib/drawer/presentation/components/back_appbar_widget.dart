
import 'package:flutter/material.dart';

import '../../../shared/global/app_colors.dart';
import '../../../shared/local/shared_preference.dart';
import '../../../shared/utils/app_constants.dart';
import '../../../shared/utils/app_values.dart';

PreferredSizeWidget myAppBarWithBack(
  BuildContext context, {
  required String title,
  required Function()? actionsButton,
  required Widget actionsWidget,
}) =>
    AppBar(
      iconTheme: const IconThemeData(color: Colors.black),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: AppSize.s0,
      automaticallyImplyLeading: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p5),
          child: InkWell(
            onTap: CacheHelper.getData(key: AppConstants.token) == null
                ? () {
                    /*
                    navigateTo(
                      context: context,
                      screenRoute: Routes.makeLoginScreen,
                      arguments:
                          const MakeLoginScreenArguments(title: 'الشراء'),
                    );
                    */
                  }
                : actionsButton,
            child: Container(
              width: AppSize.s40,
              height: AppSize.s40,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors.offWhite,
                  width: AppSize.s1,
                ),
                borderRadius: BorderRadius.circular(AppSize.s15),
              ),
              child: actionsWidget,
            ),
          ),
        ),
      ],
    );
