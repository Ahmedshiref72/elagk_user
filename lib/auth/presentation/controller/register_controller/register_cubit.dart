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


  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String username,


  })
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: "http://freelancerr-001-site1.btempurl.com/api/Auth/register",

      data:{
        'username':username,
        'email':email,
        'password':password,
        'phone':phone,

      },
    ).then((value) {
      print(value.data);

      registerModel= RegisterModel.fromJson(value.data);

      emit(RegisterSuccessState(registerModel!));
    }).catchError((error){
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }




}