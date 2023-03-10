import 'dart:async';
import 'package:elagk/pharmacy/presentation/pharmacy_controllers/categories_controller/categories_state.dart';
import 'package:elagk/shared/network/api_constants.dart';
import 'package:elagk/shared/utils/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';

import 'package:geolocator/geolocator.dart';
import '../../../../shared/network/dio_helper.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitialState());

  static CategoriesCubit get(context) => BlocProvider.of(context);


void changeStringsToDef()
{
  AppConstants.pharmacyLocation='';
  AppConstants.distance='';
  emit(StringsChangedSuccessfully());
}

  Future<void> getLocation(lat, long) async {

    var first;
    List<Placemark> addresses;
    addresses = await placemarkFromCoordinates(lat, long);

    first = addresses[2];
    emit(GetLocationState());
    AppConstants.pharmacyLocation = first.addressLine!;
  }

  Future<void> getDistance(lat1, long1) async {
    AppConstants.distance = await (Geolocator.distanceBetween(
            lat1, long1, AppConstants.myLat!,AppConstants.myLong!)/1000)
        .round()
        .toString();
    emit(GetDistanceState());
    print(AppConstants.distance);
  }
}
