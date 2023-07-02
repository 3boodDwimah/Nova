import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/Ui/cateogries/cateogries_screen.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/states.dart';
import 'package:untitled4/const/components/widget.dart';
import 'package:untitled4/const/styles/colors.dart';
import 'package:untitled4/models/categories_model.dart';
import 'package:untitled4/Ui/products/product_details/product_details.dart';

import '../../models/home_model.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if (state is ShopSuccessChangeFavoritesState) {
          if (!state.model.status!) {
            showToast(
              text: state.model.message!,
              state: ToastStates.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return (ShopCubit.get(context).homeModel != null &&
                ShopCubit.get(context).categoriesModel != null)
            ? builderWidget(ShopCubit.get(context).homeModel!,
                ShopCubit.get(context).categoriesModel!, context)
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget builderWidget(
          HomeModel model, CategoriesModel categoriesModel, context) =>
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 130,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 18, top: 8),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/Sidemenu.svg",
                          color: defaultColor,
                        ),
                        Spacer(),
                        Text.rich(
                          TextSpan(
                            style: Theme.of(context).textTheme.bodyText1,
                            children: [
                              TextSpan(
                                text: '👋 Hello, ',
                              ),
                              TextSpan(
                                text: (ShopCubit.get(context).userModel) != null?
                                ShopCubit.get(context).userModel!.data!.name!:"",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 30,
                        ),
                        SvgPicture.asset("assets/images/Notification.svg",
                            color: defaultColor),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 30),
                width: MediaQuery.of(context).size.width,
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xfff5f5f5),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(children: [
                  SizedBox(
                    width: 16,
                  ),
                  SvgPicture.asset("assets/images/Search.svg"),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Search product',
                    style: TextStyle(
                      fontFamily: 'Nunito Sans',
                      fontSize: 14,
                      color: const Color(0x993e3e3e),
                    ),
                  ),
                ]),
              ),
            ),


            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700,
                                  )

                          ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(context, CategoriesScreen());

                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            'See More',
                            style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 14,
                                      color:  Colors.grey,
                                    ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 80.0,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCategoryItem(categoriesModel.data!.data![index]),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20.0,
                      ),
                      itemCount: categoriesModel.data!.data!.length,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: [
                      Text('Recomended For You',
                          style:
                              Theme.of(context).textTheme.bodyText1?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  )),
                    ],
                  )
                ],
              ),
            ),

            Container(
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.63,
                children: List.generate(
                  model.data!.products.length,
                  (index) => buildGridProduct(
                      model.data!.products[index], context, () {
                    ShopCubit.get(context)
                        .getProductDetails(model.data!.products[index].id!);
                    //Navigator.of(context).pushNamed(ProductDetails.productDetailsScreen);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProductDetails()));
                  }),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildCategoryItem(DataModel model) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
              height: 60,
              width: 135,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 0.4),
                  child: Image.network(
                    model.image!,
                    fit: BoxFit.fitWidth,
                  ))
              // Image(

              ),
          Positioned(
            bottom: 15,
            left: 10,
            child: Container(
              width: 90,
              child: Text(
                model.name!,
                textAlign: TextAlign.start,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );

  Widget buildGridProduct(
          ProductModel model, context, void Function() onPressed) =>
      InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Card(
              color: Color(0xffDEDEE0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image(
                            image: NetworkImage(model.image!),
                            width: double.infinity,
                            fit: BoxFit.cover,
                            height: 190.0,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: IconButton(
                          onPressed: () {
                            ShopCubit.get(context).changeFavorites(model.id!);
                            print(model.id);
                          },
                          icon: CircleAvatar(
                            radius: 15.0,
                            backgroundColor:
                                ShopCubit.get(context).favorites[model.id]!
                                    ? defaultColor
                                    : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              size: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),   Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Nunito Sans',
                            fontSize: 14,
                            height: 1.4,
                            color: const Color(0xff3e3e3e),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            Text(
                              '\$ ${model.price.round()}',
                              style: TextStyle(
                                fontFamily: 'Nunito Sans',
                                fontSize: 17,
                                color: const Color(0xffff7750),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      );
}
