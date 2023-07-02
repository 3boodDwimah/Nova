import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:untitled4/bloc/cubit/homecubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/states.dart';
import 'package:untitled4/const/components/widget.dart';

int index = 0;

class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ShopCubit.get(context);
        var product = cubit.productDetailsModel!.productModel;
        var pageController = PageController();
        int pageIndex = 0;
        String productPrice = product.price.toString();
        var scrollController = ScrollController();

        return (state is! ShopLoadingGetProductDetailsState && product != null)
            ? Scaffold(
                body: SafeArea(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              height: MediaQuery.of(context).size.height/3,
                              child: CarouselSlider.builder(
                                itemCount: product.images.length,
                                options: CarouselOptions(
                                  height: 150,
                                  viewportFraction: 1.0,
                                  enlargeCenterPage: true,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      // _current = index;
                                    });
                                  },
                                  autoPlayInterval: Duration(seconds: 2),
                                  autoPlayAnimationDuration:
                                      Duration(seconds: 1),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                ),
                                itemBuilder: (ctx, index, realIdx) {
                                  return Container(
                                    child: Image(
                                      image:
                                          NetworkImage(product.images[index]),
                                      fit: BoxFit.fill,
                                      height: 450,
                                      width: 450,
                                    ),
                                  );
                                },
                              )),
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                            color: Theme.of(context).focusColor,

                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0x40cacaca),
                                offset: Offset(0, 4),
                                blurRadius: 300,
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 80,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.3,
                                            child: SingleChildScrollView(
                                              child: Text(
                                                product.name,
                                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                              ),
                                            ),
                                          ),
                                          Spacer(),
                                          Align(
                                            alignment: Alignment.center,
                                            child: IconButton(
                                              icon: Icon(
                                                cubit.favorites[product.id]!
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                              ),
                                              color:
                                                  cubit.favorites[product.id]!
                                                      ? Color(0xfdFF4848)
                                                          .withOpacity(.7)
                                                      : Color(0xffFF4848)
                                                          .withOpacity(.9),
                                              onPressed: () {
                                                cubit.changeFavorites(
                                                    product.id);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            productPrice.length == 5
                                                ? '\$ ${productPrice.substring(0, 2)},${productPrice.substring(2, productPrice.length)} '
                                                : '\$ $productPrice ',
                                            style: TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.deepOrange,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.0,

                                          ),

                                        ],


                                      ),
                                      SizedBox(height: 15,),
                                      Text(
                                        'Description',
                                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        height: 222.0,
                                        width: double.infinity,
                                        padding: EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10.0),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Text(
                                            product.description,
                                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: buildAddToCartButton(
                                label: 'Add to cart',
                                onPressed: () {
                                  ShopCubit.get(context)
                                      .addProductToCart(product.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                          'Added to cart successfully!'),
                                      action: SnackBarAction(
                                        textColor: Colors.white,
                                        label: 'Go to Cart',
                                        onPressed: () {
                                          ShopCubit.get(context)
                                              .getInCartProducts();

                                        },
                                      ),
                                    ),
                                  );
                                  print('added to cart');
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
