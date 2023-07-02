import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Ui/SplashScreen/splach_screen.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/themecubit/cubit.dart';
import 'package:untitled4/bloc/cubit/themecubit/states.dart';
import 'package:untitled4/bloc/sherd/cache_helper.dart';
import 'package:untitled4/bloc/dio/dio_helper.dart';
import 'package:untitled4/const/styles/themes.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getData(key: 'isDark');



  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({
    Key? key,
    this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavorites()
            ..getUserData()
            ..getProductDetails(53)
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.light


                    : ThemeMode.dark,
            home: SplachScreen(),
          );
        },
      ),
    );
  }
}
