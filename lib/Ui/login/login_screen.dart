import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/Ui/home/home.dart';
import 'package:untitled4/bloc/cubit/logincubit/cubit/cubit.dart';
import 'package:untitled4/bloc/cubit/logincubit/cubit/states.dart';
import 'package:untitled4/const/components/widget.dart';
import 'package:untitled4/Ui/register/register_screen.dart';

import 'package:untitled4/bloc/sherd/cache_helper.dart';
import 'package:untitled4/const/styles/colors.dart';



class ShopLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status!) {
              print(state.loginModel.message);
              print(state.loginModel.data!.token);

              CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token,
              ).then((value) {
                token = state.loginModel.data!.token!;

                navigateAndFinish(
                  context,
                  ShopLayout(),
                );
              });
            } else {
              print(state.loginModel.message);

              showToast(
                text: state.loginModel.message!,
                state: ToastStates.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all( 20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 75,),
                        Text(
                          'Hello There',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Nunito Sans',
                            fontSize: 16,
                            height: 1.75,
                          ) ,


                          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                        ),SizedBox(height: 10,),
                        Text(
                          'Welcome Back',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontFamily: 'Nunito Sans',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          colors: Theme.of(context).accentColor,

                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',

                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(

                          colors: Theme.of(context).accentColor,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: ShopLoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              ShopLoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          suffixPressed: () {
                            ShopLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',

                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height/3.5
                        ),
                        (state is! ShopLoginLoadingState)
                            ? defaultButton(
                          height: 63.83,
                          radius: 15,
                          background: defaultColor,

                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopLoginCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'login',
                                isUpperCase: true,
                              )
                            : Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account? Please',
                              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 15

                              ),
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(
                                  context,
                                  ShopRegisterScreen(),
                                );
                              },
                              text: 'Sign Up',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
