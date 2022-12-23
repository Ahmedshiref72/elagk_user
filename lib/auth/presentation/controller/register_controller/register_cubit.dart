import 'package:elagk/auth/data/models/register_model/register_model.dart';
import 'package:elagk/auth/presentation/controller/register_controller/register_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/network/dio_helper.dart';
import '../../../../shared/utils/app_constants.dart';


class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit(): super(RegisterInitialState());

  static  RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel? registerModel;


  Future<void> userRegister({
    required String email,
    required String password,
    required String phone,
    required String username,


  }) async
  {
    emit(RegisterLoadingState());
    await DioHelper.postData(
      url: "http://freelancerr-001-site1.btempurl.com/api/Auth/register",

      data:{
        'username':username,
        'email':email,
        'password':password,
        'phone':phone,

      },
    ).then((value) {
      print(value.data.toString());

      // registerModel= RegisterModel.fromJson(value.data);

      emit(RegisterSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }




}