import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Ui/search/search_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/states.dart';
import 'package:untitled4/const/styles/colors.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        return Scaffold(
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedFontSize: 7,
            unselectedFontSize: 7,
            onTap: (index) {
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: SvgPicture.asset("assets/images/Home.svg",
                    color: defaultColor),
                icon: SvgPicture.asset("assets/images/Home.svg",color: Colors.grey[500],),
                // Image.asset("assets/images/Home.png"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/Search.svg",color: Colors.grey[500],),
                activeIcon: SvgPicture.asset("assets/images/Search.svg",
                    color: defaultColor),
                // Icon(
                //   Icons.apps,
                // ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  size: 24.0,color: Colors.grey[410],
                ), activeIcon:  Icon(
                  Icons.favorite_border,
                  size: 24.0,color: defaultColor                ),
                // color: defaultColor),
                //Icon(
                //   Icons.favorite,
                // ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/Profile.svg",
                  color: Colors.grey[500],
                ),
                activeIcon: SvgPicture.asset("assets/images/Profile.svg",
                    color: defaultColor),
                // Icon(
                //   Icons.settings,
                // ),
                label: '',
              ),
            ],
          ),
        );
      },
    );
  }
}
