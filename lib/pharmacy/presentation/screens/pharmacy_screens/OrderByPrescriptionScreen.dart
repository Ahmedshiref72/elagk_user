import 'package:elagk/drawer/presentation/controller/profile_controller/profile_cubit.dart';
import 'package:elagk/home/presentation/components/app_bar_basket_icon.dart';
import 'package:elagk/pharmacy/presentation/components/OrderByPrescriptionComponents/OrderByPrescriptionContent.dart';
import 'package:elagk/shared/components/second_appBar.dart';
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/app_strings.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderByPrescriptionScreen extends StatelessWidget {
  const OrderByPrescriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
            appBar: SecondAppBar(
              context: context,
              title: AppStrings.prescriptionHeader,
              actionWidget: const AppBarBasketIcon(),
              onTap: () {
                navigateTo(
                  context: context,
                  screenRoute: Routes.basketScreen,
                );
              },
            ),
            body: BlocConsumer<ProfileCubit, ProfileStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return OrderByPrescriptionContent();
                })),
        // HomeScreen
      ),
    );
  }
}