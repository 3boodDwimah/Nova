import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Ui/home/home.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/states.dart';
import 'package:untitled4/models/categories_model.dart';
import 'package:untitled4/const/navigator.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: IconButton(
                          onPressed: () {
                            navigateAndFinish(context, ShopLayout());
                          },
                          icon:  Icon(Icons.arrow_back_sharp,color: Theme.of(context).focusColor,))),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    child:  Padding(
                      padding: EdgeInsetsDirectional.only(start: 15),
                      child: Text(
                        'Category',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(
                          fontFamily: 'Nunito Sans',
                          height: 1,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 1.6),
                      itemBuilder: (context, index) => buildCatItem(
                          ShopCubit.get(context)
                              .categoriesModel!
                              .data!
                              .data![index]),
                      itemCount: ShopCubit.get(context)
                          .categoriesModel!
                          .data!
                          .data!
                          .length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  //

  Widget buildCatItem(DataModel model) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(children: [
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model.image!),
                opacity: 70,
                fit: BoxFit.cover,
              ),
              color: Colors.black,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 5,
          child: Container(
            height: 40,
            child: Text(
              model.name!,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3dc5c5c5),
                  offset: const Offset(0, -2),
                  blurRadius: 10,
                ),
              ],
            ),
            height: 13,
            //width: MediaQuery.of(context).size.width,
          ),
          bottom: 0,
        )
      ])



  );
}