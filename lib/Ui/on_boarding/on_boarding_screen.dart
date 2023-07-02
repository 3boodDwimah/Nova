import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled4/Ui/login/login_screen.dart';
import 'package:untitled4/const/styles/colors.dart';
import 'package:untitled4/const/navigator.dart';
import 'package:untitled4/bloc/sherd/cache_helper.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/Group 3348.png',
      title: 'Discover a New For You',
      body: 'Lots of new products here and decide \n which product is best for you',
    ),
    BoardingModel(
      image: 'assets/images/Group 3349.png',
      title: 'Find Your Best Product',
      body: ' \t  Famous and quality product at \n affordable prices',
    ),
    BoardingModel(
      image: 'assets/images/Group 3350.png',
      title: 'Express Product Delivery',
      body: 'Your product will be delivered to your \n home safetly and securely',
    ),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          ShopLoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 120,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 00.0),
                    child: SmoothPageIndicator(
                      controller: boardController,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: defaultColor,
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 15.0,
                      ),
                      count: boarding.length,
                    ),
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 63.83,
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontSize: 16,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: defaultColor,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x14afaeae),
                              offset: Offset(0, 10),
                              blurRadius: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                             ],

              ),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(

            child: Column(
              children: [
                Padding(padding: EdgeInsetsDirectional.only(start: 5),
                  child: Text(
                    '${model.title}',
                    style:
                    Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontFamily: 'Nunito Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 5),
                  child: Text(
                    '${model.body}',
                    style:
                    Theme.of(context).textTheme.bodyText1?.copyWith(

                  fontFamily: 'Nunito Sans',
                  fontSize: 18,
                  height: 1.75,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                          ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      );
}
