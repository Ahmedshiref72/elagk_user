import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:elagk/auth/presentation/controller/register_controller/register_cubit.dart';
import 'package:elagk/auth/presentation/controller/register_controller/register_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/components/toast_component.dart';
import '../../../../../shared/global/app_colors.dart';
import '../../../../../shared/utils/app_routes.dart';
import '../../../../../shared/utils/app_strings.dart';
import '../../../../../shared/utils/app_values.dart';
import '../../../../../shared/utils/navigation.dart';
import '../../../../../shared/utils/text_field_validation.dart';
import '../../../components/MainTextFormField.dart';
import '../../../components/auth_title_subtitle_widget.dart';
import '../../../components/logo_widget.dart';
import '../../../components/main_button.dart';
import '../../../components/screen_background.dart';
import '../../../controller/login_controller/login_cubit.dart';
import '../../../controller/login_controller/login_states.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  static final _formKey1 = GlobalKey<FormState>();
  static final _emailController = TextEditingController();
  static final _firstNameController = TextEditingController();
  static final _lastNameController = TextEditingController();
  static final _phoneController = TextEditingController();
  static final _passwordController = TextEditingController();
  static final _userNameController = TextEditingController();

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: ScreenBackground(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppPadding.p15),
                child: Form(
                  key: RegisterScreen._formKey1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const LogoWidget(),
                      const AuthTitleAndSubtitle(
                        authTitle: AppStrings.createAccount,
                        authSubtitle: AppStrings.createAccount1,
                      ),
                      //full name
                      MainTextFormField(
                        controller: RegisterScreen._firstNameController,
                        label: AppStrings.firstName,
                        hintColor: AppColors.lightGrey,
                        inputType: TextInputType.text,
                        textDirection: TextDirection.ltr,
                        obscure: false,
                        validator: (value) {
                          if (value!.length < AppSize.s0) {
                            return AppStrings.enterValidFullName;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      MainTextFormField(
                        controller: RegisterScreen._lastNameController,
                        label: AppStrings.lastName,
                        hintColor: AppColors.lightGrey,
                        inputType: TextInputType.text,
                        textDirection: TextDirection.ltr,
                        obscure: false,
                        validator: (value) {
                          if (value!.length < AppSize.s0) {
                            return AppStrings.enterValidFullName;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      MainTextFormField(
                        controller: RegisterScreen._userNameController,
                        label: AppStrings.userName,
                        hintColor: AppColors.lightGrey,
                        inputType: TextInputType.text,
                        textDirection: TextDirection.ltr,
                        obscure: false,
                        validator: (value) {
                          if (value!.length < AppSize.s0) {
                            return AppStrings.enterValidFullName;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      //phone
                      MainTextFormField(
                        controller: RegisterScreen._phoneController,
                        label: AppStrings.phoneNumber,
                        hint: AppStrings.enterValidPhone,
                        hintColor: AppColors.lightGrey,
                        inputType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                        obscure: false,
                        validator: (value) {
                          if (value!.length < AppSize.s12) {
                            return AppStrings.enterValidPassword;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      //email
                      MainTextFormField(
                        controller: RegisterScreen._emailController,
                        label: AppStrings.email,
                        hint: AppStrings.emailExample,
                        hintColor: AppColors.lightGrey,
                        inputType: TextInputType.emailAddress,
                        textDirection: TextDirection.ltr,
                        obscure: false,
                        validator: (value) => validateEmail(value!),
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s30),
                      //password
                      MainTextFormField(
                        controller: RegisterScreen._passwordController,

                        label: AppStrings.password,
                        hint: AppStrings.passwordExample,
                        hintColor: AppColors.lightGrey,
                        inputType: TextInputType.visiblePassword,
                        textDirection: TextDirection.ltr,
                        obscure: true,
                        validator: (value) {
                          if (value!.length < AppSize.s8) {
                            return AppStrings.enterValidPassword;
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: mediaQueryHeight(context) / AppSize.s30,
                      ),
                      BlocConsumer<RegisterCubit, RegisterStates>(
                        listener: (context, state) {
                          if (state is RegisterSuccessState) {
                            showToast(
                                text: 'Register Successfully',
                                state: ToastStates.SUCCESS);
                            navigateTo(
                                context: context,
                                screenRoute: Routes.loginScreen);
                          } else if (state is RegisterErrorState) {
                            showToast(
                                text: '${state.error}',
                                state: ToastStates.ERROR);
                          }
                        },
                        builder: (context, state) {
                          return ConditionalBuilder(
                              condition: (state is RegisterLoadingState),
                              builder: (context) => const CircularProgressIndicator(),
                              fallback: (context) => MainButton(
                                    title: AppStrings.createAccount,
                                    onPressed: () {
                                      if (RegisterScreen._formKey1.currentState!.validate()) {
                                        RegisterCubit.get(context).userRegister(
                                          email: RegisterScreen._emailController.text.trim(),
                                          password:
                                              RegisterScreen._passwordController.text.trim(),
                                          phone: RegisterScreen._phoneController.text.trim(),
                                          username:RegisterScreen._userNameController.text.trim(),
                                          firstName: RegisterScreen._firstNameController.text.trim(),
                                          lastName: RegisterScreen._lastNameController.text.trim(),
                                        );
                                      };


                                    },
                                  ));
                        },
                      ),
                      SizedBox(height: mediaQueryHeight(context) / AppSize.s60),
                      Center(
                          child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppStrings.alreadyHaveAccount,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            TextSpan(
                              text: ' ${AppStrings.login}',
                              style: Theme.of(context).textTheme.labelMedium,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  navigateTo(
                                      context: context,
                                      screenRoute: Routes.loginScreen);
                                },
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
        ),
      ),
    );
  }
}
