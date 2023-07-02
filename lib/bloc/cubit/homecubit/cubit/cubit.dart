import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Ui/porfile/profile.dart';
import 'package:untitled4/Ui/search/search_screen.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/states.dart';
import 'package:untitled4/bloc/dio/rout.dart';
import 'package:untitled4/const/components/widget.dart';
import 'package:untitled4/models/categories_model.dart';
import 'package:untitled4/models/change_favorites_model.dart';
import 'package:untitled4/models/favorites_model.dart';
import 'package:untitled4/models/get_cart.dart';
import 'package:untitled4/models/home_model.dart';
import 'package:untitled4/models/in_cart_product_model.dart';
import 'package:untitled4/models/login_model.dart';
import 'package:untitled4/models/product_details_model.dart';
import 'package:untitled4/Ui/favorites/favorites_screen.dart';
import 'package:untitled4/Ui/products/products_screen.dart';
import 'package:untitled4/bloc/dio/dio_helper.dart';


class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
   ProductsScreen(),
    SearchScreen(),
    FavoritesScreen(),
    const Profile(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel? homeModel;

  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);



      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id!: element.inFavorites!,
        });
      });


      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;

    emit(ShopChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if (!changeFavoritesModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }

      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;

      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());

      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessUserDataState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void updateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);

      emit(ShopSuccessUpdateUserState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }

  ProductDetailsModel? productDetailsModel;

  void getProductDetails(int productID) {
    emit(ShopLoadingGetProductDetailsState());
    DioHelper.getData(
      url: 'products/$productID',
      token: token,
    ).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
      emit(ShopSuccessGetProductDetailsState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetProductDetailsState());
    });
  }

  AddToCart? addToCart;

  void addProductToCart(int productID) {
    emit(ShopLoadingAddProductToCartState());

    DioHelper.postData(url: "CART", token: token, data: {
      'product_id': '$productID',
    }).then((value) {
      addToCart = AddToCart.fromJson(value.data);
      print('${addToCart!.status}, Added Successfully.');
      emit(ShopSuccessAddProductToCartState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorAddProductToCartState());
    });
  }

  GetCart? getCart;

  void getInCartProducts() {
    emit(ShopLoadingGetCartState());
    DioHelper.getData(url: "CART", token: token).then((value) {
      getCart = GetCart.fromJson(value.data);
      emit(ShopSuccessGetCartState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetCartState());
    });
  }



}
