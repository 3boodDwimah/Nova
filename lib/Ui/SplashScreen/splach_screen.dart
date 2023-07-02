import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/Ui/home/home.dart';

import 'package:untitled4/Ui/login/login_screen.dart';
import 'package:untitled4/Ui/on_boarding/on_boarding_screen.dart';
import 'package:untitled4/const/components/widget.dart';
import 'package:untitled4/bloc/sherd/cache_helper.dart';


class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

Widget? widget;

class _SplachScreenState extends State<SplachScreen> {
  void delay() {
    Future.delayed(const Duration(seconds: 5), () {
      navigateAndFinish(
        context,
        widget,
      );
    });
  }

  @override
  void initState() {
    bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
    token = CacheHelper.getData(key: 'token');

    if (onBoarding != null) {
      if (token != null) {
        widget = ShopLayout();
      } else {
        widget = ShopLoginScreen();
      }
    } else {
      widget = OnBoardingScreen();
    }
    delay();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 


        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/nova.svg",height: 55),
            SizedBox(width: 10,),Text(
              'Nova',
              style:
              Theme.of(context).textTheme.bodyText1?.copyWith(

                fontFamily: 'Nunito Sans',
                fontSize: 34,

                fontWeight: FontWeight.w700,
              ),
            )
          ],
        )
      ),
    );
  }
}
