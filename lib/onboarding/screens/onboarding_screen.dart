import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../auth/presentation/components/screen_background.dart';
import '../../shared/utils/app_assets.dart';
import '../../shared/utils/app_values.dart';

import '../components/onboarding_appBar.dart';
import '../components/onboarding_item.dart';
import '../controllers/onboarding_cubit.dart';
import '../controllers/onboarding_model.dart';
import '../controllers/onboarding_state.dart';




class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();



  @override
  Widget build(BuildContext context,) {
    return BlocConsumer<OnboardingCubit,OnboardingStates>(
      listener:(context,state){} ,
      builder:(context,state)
      {
        List<BoardingModel> boarding = [
          BoardingModel(
              title: 'Welcome To ',
              body: 'Facilitates ',
              image: ImageAssets.elagkStore,
              color: Colors.green
          ),
          BoardingModel(
              title: 'We are making  ',
              body: 'Together',
              image: 'images/onBoarding2.png',
              color: Colors.blue
          ),
          BoardingModel(
              title: ' system',
              body: 'Smart ',
              image: 'images/onBoarding3.png',
              color: Colors.red
          )
        ];

        var cubit=OnboardingCubit.get(context);
        return Directionality(
          textDirection:  TextDirection.rtl,

          child: SafeArea(
            child: Scaffold(

              body: ScreenBackground(

                child: Stack(
                 children: [
                   Container(

                   ),
                   Padding(
                     padding: EdgeInsets.all(AppPadding.p20),
                     child: Column(

                       children: [
                         OnboardingAppBar(
                             context: context,
                             title: "",
                             onTap: () {
                               cubit.submit(context);
                             },
                             actionWidget:  TextButton(
                                 onPressed: (){
                                   cubit.submit(context);
                                 },
                                 child: Row(
                                   children: const [
                                     Text('تخطى',
                                       style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)
                                       ,),
                                   ],
                                 ))
                         ),
                         Expanded(
                           child: PageView.builder(
                             controller:  boardController,
                             onPageChanged: (int index){
                               cubit.changeOnBoarding(index,boarding.length);
                             },
                             physics:  BouncingScrollPhysics(),
                             itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                             itemCount: boarding.length,
                           ),
                         ),
                         SizedBox(
                           height: 40,
                         ),
                         Row(
                           children: [
                             FloatingActionButton(
                               backgroundColor:Colors.greenAccent,
                               onPressed: ()
                               {
                                 if(cubit.isLast)
                                 {
                                   cubit.submit(context);
                                 }else
                                 {
                                   boardController.nextPage(
                                     duration: Duration(
                                       milliseconds: 750,
                                     ),
                                     curve: Curves.fastLinearToSlowEaseIn,
                                   );
                                 }
                               },
                               child:  Icon(Icons.arrow_back_ios_rounded),
                             ),
                             Spacer(),
                             SmoothPageIndicator(
                               controller: boardController,
                               effect: ExpandingDotsEffect(
                                 activeDotColor:Colors.green,
                                 dotColor: Colors.greenAccent,
                                 dotHeight: 10,
                                 expansionFactor: 3,
                                 dotWidth: 10,
                                 spacing: 5,
                               ),
                               count: boarding.length,
                             ),


                           ],
                         ),
                       ],
                     ),
                   ),
                 ],
                ),
              ),
            ),
          ),
        );
      } ,

    );
  }


}
