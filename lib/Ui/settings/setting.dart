import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled4/Ui/settings/switch_example.dart';
import 'package:untitled4/bloc/cubit/themecubit/cubit.dart';
import 'package:untitled4/const/styles/colors.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

bool light = false;
bool va = true;

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              size: 27,
            )),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text('Settings',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 22))),
          SizedBox(
            height: 30,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.5),
                    child: SvgPicture.asset(
                      "assets/images/Notification.svg",
                      color: defaultColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      width: 85,
                      child: Text(
                        'Notification',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: SwitchExample())
                ],
              ),
            ),

            margin: EdgeInsets.only(left: 25, right: 25),
            //height: 64,
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              height: 70,
              child: Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  SvgPicture.asset(
                    'assets/images/Location.svg',
                    color: defaultColor,
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                    width: 80,
                    child: Text(
                      'Location',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFFFF7750),
                  ),
                  SizedBox(
                    width: 25,
                  )
                ],
              ),
            ),

            margin: EdgeInsets.only(left: 25, right: 25),
            //height: 64,
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.5),
                    child: Icon(
                      Icons.dark_mode_outlined,
                      color: defaultColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: 80,
                      child: Text(
                        'Dark Mode',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Switch(
                      // This bool value toggles the switch.
                      value: light,
                      activeColor: defaultColor,
                      onChanged: (bool value) {
                        // This is called when the user toggles the switch.
                        setState(() {
                          print("object");
                          AppCubit.get(context).changeAppMode();

                          light = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),

            margin: EdgeInsets.only(left: 25, right: 25),
            //height: 64,
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              height: 70,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 23.5),
                      child: SvgPicture.asset(
                        'assets/images/Team.svg',
                        color: defaultColor,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      'Contact Us',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            margin: EdgeInsets.only(left: 25, right: 25),
            //height: 64,
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Bind Account',
              style:Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 16
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.5),
                    child: SvgPicture.asset('assets/images/Google.svg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: 80,
                      child: Text(
                        'Google',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: SwitchExample(),
                  ),
                ],
              ),
            ),

            margin: EdgeInsets.only(left: 25, right: 25),
            //height: 64,
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              height: 70,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 23.5),
                    child: SvgPicture.asset('assets/images/Facebook.svg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Container(
                      width: 80,
                      child: Text(
                        'Facebook',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: SwitchExample(),
                  ),
                ],
              ),
            ),

            margin: EdgeInsets.only(left: 25, right: 25),
            //height: 64,
          ),

          SizedBox(height: 20,),
        ],
      ),
    );
  }
}
