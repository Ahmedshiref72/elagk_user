import 'package:elagk/drawer/presentation/components/pharmacy_user_profile/pharmacy_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/global/app_colors.dart';
import '../../../../shared/utils/app_values.dart';
import '../../controller/categories_controller/categories_bloc.dart';

class PharmacyCategories extends StatelessWidget {
  const PharmacyCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s40,
      color: Colors.transparent,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.category!.length,
            itemBuilder: (BuildContext context, int index) {
              return Categories(
                onTap: () {
                  context.read<CategoriesBloc>().add(
                        ChangeCategoryIndexEvent(index),
                      );
                  context.read<CategoriesBloc>().add(
                        GetMedicinesEvent(
                          categoryName:
          state.category![index].categoryName,
                        ),
                      );
                },
                categoryName: state.category![index].categoryName,
                containerColor: state.selectedIndex == index
                    ? AppColors.offBlue
                    : Colors.white,
                textColor: state.selectedIndex == index
                    ? Colors.white
                    : Colors.black,
                borderColor: state.selectedIndex == index
                    ? null
                    : Border.all(color: AppColors.lightGrey),
              );
            },
          );
        },
      ),
    );
  }
}
