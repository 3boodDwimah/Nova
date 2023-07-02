

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/bloc/cubit/profielcubit/cubit/steats.dart';
import 'package:untitled4/bloc/dio/rout.dart';
import 'package:untitled4/const/components/widget.dart';
import 'package:untitled4/models/login_model.dart';
import 'package:untitled4/bloc/dio/dio_helper.dart';


class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() : super(EditProfileInitialState());

  static EditProfileCubit get(context) => BlocProvider.of(context);




ShopLoginModel? userModel;

void getUserData() {
  emit(EditProfileLoadingUserDataState());

  DioHelper.getData(
    url: PROFILE,
    token: token,
  ).then((value) {
    userModel = ShopLoginModel.fromJson(value.data);

    emit(EditProfileSuccessUserDataState(userModel!));
  }).catchError((error) {
    print(error.toString());
    emit(EditProfileErrorUserDataState());
  });
}


void updateUserData({
  required String name,
  required String email,
  required String phone,
}) {
  emit(EditProfileLoadingUpdateUserState());

  DioHelper.putData(
    url: UPDATE_PROFILE
    ,
    token: token,
    data: {
      'name': name,
      'email': email,
      'phone': phone,
    },
  ).then((value) {
    userModel = ShopLoginModel.fromJson(value.data);

    emit(EditProfileSuccessUpdateUserState(userModel!));
  }).catchError((error) {
    print(error.toString());
    emit(EditProfileErrorUpdateUserState());
  });
}}