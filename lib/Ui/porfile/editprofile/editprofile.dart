import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Ui/home/home.dart';
import 'package:untitled4/bloc/cubit/profielcubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/profielcubit/cubit/steats.dart';
import 'package:untitled4/const/styles/colors.dart';

import 'package:untitled4/const/navigator.dart';

class EditProfile extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => EditProfileCubit()..getUserData(),
      child: BlocConsumer<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          nameController.text =
              EditProfileCubit.get(context).userModel?.data?.name ?? "";
          emailController.text =
              EditProfileCubit.get(context).userModel?.data?.email ?? "";
          phoneController.text =
              EditProfileCubit.get(context).userModel?.data?.phone ?? "";

          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                     navigateAndFinish(context, ShopLayout());
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,

                    )),
                elevation: 0,
                centerTitle: true,
              ),
              body: (EditProfileCubit.get(context).userModel != null)
                  ? SafeArea(
                      child: SingleChildScrollView(
                        child:

                            Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Edit Profile',
                                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                    child: Image.asset(
                                        'assets/images/img_profile.png')),
                                SizedBox(
                                  height: 30,
                                ),
                                if (state is EditProfileLoadingUpdateUserState)
                                  LinearProgressIndicator(color: defaultColor
                                    ,),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                    ),
                                    controller: nameController,
                                    keyboardType: TextInputType.name,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'name must not be empty';
                                      }

                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsetsDirectional.only(
                                              start: 45, top: 50),
                                      filled: true,
                                      focusColor: Color(0xfff6f6f7),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    )),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                    ),
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'email must not be empty';
                                      }

                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsetsDirectional.only(
                                              start: 45, top: 50),
                                      filled: true,
                                      focusColor: Color(0xfff6f6f7),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    )),
                                SizedBox(
                                  height: 20.0,
                                ),
                                TextFormField(
                                  style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                  ),
                                    controller: phoneController,
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'phone must not be empty';
                                      }

                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsetsDirectional.only(
                                              start: 45, top: 50),
                                      filled: true,
                                      focusColor: Color(0xfff6f6f7),
                                      hintText: "Email",
                                      hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    )),
                                SizedBox(
                                  height: 90.0,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 63,
                                  child: MaterialButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        EditProfileCubit.get(context)
                                            .updateUserData(
                                          name: nameController.text,
                                          phone: phoneController.text,
                                          email: emailController.text,
                                        );
                                      }
                                    },
                                    child:
                                    Text(
                                      'Save Changes',
                                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                        fontFamily: 'Nunito Sans',
                                        fontSize: 16,
                                        color: const Color(0xffffffff),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ),
                                  decoration: BoxDecoration(
                                    color: defaultColor,
                                    borderRadius: BorderRadius.circular(30.0),

                                    //color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
