import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/states.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return (state is! ShopLoadingGetFavoritesState)
            ? (ShopCubit.get(context).favoritesModel != null)
                ? SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsetsDirectional.only(start: 20),
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Liked Product',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(
                                fontFamily: 'Nunito Sans',
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              itemBuilder: (context, index) => buildListProduct(
                                  ShopCubit.get(context)
                                      .favoritesModel!
                                      .data!
                                      .data![index]
                                      .product,
                                  context),
                              itemCount: ShopCubit.get(context)
                                  .favoritesModel!
                                  .data!
                                  .data!
                                  .length,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Center(child: CircularProgressIndicator())
            : Center(child: CircularProgressIndicator());
      },
    );
  }
}

Widget buildListProduct(model, BuildContext context) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 7,
          ),
          Row(
            children: [
              SizedBox(width: 20),
              Container(
                height: 59,
                width: 59,
                child: Image.network(
                  model.image!,
                  width: 79,
                  height: 79,
                  fit: BoxFit.fitHeight,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      height: 50,
                      child: Text(model.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontFamily: 'Nunito Sans',
                                  height: 1.5,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 180,
                          child: Text(
                            "  \t\$ ${model.price.toString()}",
                            style: TextStyle(
                              fontFamily: 'Nunito Sans',
                              fontSize: 17,
                              color: const Color(0xffff7750),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ));
