import 'package:untitled4/models/login_model.dart';

abstract class EditProfileStates {}

class EditProfileInitialState extends EditProfileStates {}

class EditProfileLoadingUserDataState extends EditProfileStates {}

class EditProfileSuccessUserDataState extends EditProfileStates
{
  final ShopLoginModel loginModel;

  EditProfileSuccessUserDataState(this.loginModel);
}

class EditProfileErrorUserDataState extends EditProfileStates {}

class EditProfileLoadingUpdateUserState extends EditProfileStates {}

class EditProfileSuccessUpdateUserState extends EditProfileStates
{
  final ShopLoginModel loginModel;

  EditProfileSuccessUpdateUserState(this.loginModel);
}

class EditProfileErrorUpdateUserState extends EditProfileStates {}
