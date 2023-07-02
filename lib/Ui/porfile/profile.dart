import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/Ui/Payment/Payment.dart';
import 'package:untitled4/Ui/home/home.dart';
import 'package:untitled4/Ui/login/login_screen.dart';
import 'package:untitled4/Ui/porfile/editprofile/editprofile.dart';
import 'package:untitled4/Ui/settings/setting.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/cubit.dart';
import 'package:untitled4/bloc/sherd/cache_helper.dart';
import 'package:untitled4/const/styles/colors.dart';
import 'package:untitled4/const/navigator.dart';

import '../myCart/my Cart.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        title: Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  navigateTo(context, Setting());
                },
                icon: Icon(
                  Icons.settings_outlined,
                  size: 27,
                ),
              )),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
                child: Image.asset(
                  'assets/images/img_profile.png',
                )),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
                  (ShopCubit.get(context).userModel) != null
                      ? ShopCubit.get(context).userModel!.data!.name!
                      : "",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(),
                )),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                navigateTo(context, EditProfile());

              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset("assets/images/Profile.svg",
                            color: defaultColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 85,
                          child: Text(
                            "Edit Profile",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navigateTo(context, EditProfile());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.deepOrange,
                          )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),

                margin: EdgeInsets.only(left: 25, right: 25),
                //height: 64,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                navigateTo(context, MyCart());

              },

              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          "assets/images/List.svg",
                          color: defaultColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 85,
                          child: Text(
                            "My Purchases",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.deepOrange,
                          )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),

                margin: EdgeInsets.only(left: 25, right: 25),
                //height: 64,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                navigateTo(context, Payment());

              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          "assets/images/Wallet.svg",
                          color: defaultColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 85,
                          child: Text(
                            "My Wallet ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navigateTo(context, Payment());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.deepOrange,
                          )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),

                margin: EdgeInsets.only(left: 25, right: 25),
                //height: 64,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                height: 70,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: SvgPicture.asset(
                        "assets/images/Time.svg",
                        color: defaultColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 85,
                        child: Text(
                          "Recent Viewed ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.deepOrange,
                        )),
                    SizedBox(
                      width: 20,
                    )
                  ],
                ),
              ),

              margin: EdgeInsets.only(left: 25, right: 25),
              //height: 64,
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                void signOut(context) {
                  CacheHelper.removeData(
                    key: 'token',
                  ).then((value) {
                    if (value) {
                      navigateAndFinish(
                        context,
                        ShopLoginScreen(),
                      );
                    }
                  });
                }
                signOut(context);

              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  height: 70,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 4),
                        child: SvgPicture.asset(
                          "assets/images/Logout.svg",
                          color: defaultColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          width: 85,
                          child: Text(
                            "Logout ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            void signOut(context) {
                              CacheHelper.removeData(
                                key: 'token',
                              ).then((value) {
                                if (value) {
                                  navigateAndFinish(
                                    context,
                                    ShopLoginScreen(),
                                  );
                                }
                              });
                            }

                            signOut(context);
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.deepOrange,
                          )),
                      SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                ),

                margin: EdgeInsets.only(left: 25, right: 25),
                //height: 64,
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}