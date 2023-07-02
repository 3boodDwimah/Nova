import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled4/Ui/login/login_screen.dart';
import 'package:untitled4/bloc/cubit/homecubit/cubit/cubit.dart';
import 'package:untitled4/bloc/sherd/cache_helper.dart';
import 'package:untitled4/const/styles/colors.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  double height = 50,
  required VoidCallback function,
  //required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child:
      MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
String? token = '';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  String? hint,
  required FormFieldValidator validate,
  String? label,
  Color?colors,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(

      style: TextStyle(color: colors),

      controller: controller,
      keyboardType: type,

      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        filled: true,
        focusColor:colors ,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 16,
          color: colors,
        ),
        labelText: label,
        labelStyle: TextStyle(
          color: colors
        ),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );

Widget defaultTextButton({
  required VoidCallback function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        style: TextStyle(
          color: const Color(0xffff7750),
          fontWeight: FontWeight.w600,
        ),
        text.toUpperCase(),
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget buildListProduct(
  model,
  context, {
  bool isOldPrice = true,
}) =>
    Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          margin: EdgeInsetsDirectional.only(start: 10, end: 10),


          child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Container(
                    height: 79,
                    width: 79,

                    child: Image.network(
                      model.image,
                      width: 79,
                      height: 79,
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffdedee0),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 40,
                          child: Text(
                            model.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            Theme.of(context).textTheme.bodyText1?.copyWith(

                              fontFamily: 'Nunito Sans',
                              height: 1.5,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,),


                          ),),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 180,
                              child: Text(
                                "  \t\$ ${model.price.toString()}",
                                style:
                                Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontFamily: 'Nunito Sans',
                                  fontSize: 17,
                                  color: const Color(0xffff7750),
                                  fontWeight: FontWeight.w700,
                                )


                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                ShopCubit.get(context)
                                    .changeFavorites(model.id);
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
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )

        );

Widget buildAddToCartButton({
  double? size = double.infinity,
  required String label,
  required void Function() onPressed,
}) {
  return Container(
    width: size,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20.0),
        elevation: 10,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          SizedBox(
            width: 5.0,
          ),
          Text(
            'Add To Chart',
            style: TextStyle(
              fontFamily: 'Nunito Sans',
              fontSize: 16,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}
