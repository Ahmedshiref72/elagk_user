
import 'package:elagk/shared/utils/app_routes.dart';
import 'package:elagk/shared/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:elagk/shared/utils/app_values.dart';
import 'package:elagk/shared/utils/app_strings.dart';

class PharmacyProductsBar extends StatelessWidget {
  const PharmacyProductsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Row(
        children: [
          Text(
            "صيدلية 19011",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
