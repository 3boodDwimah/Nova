import 'package:flutter/material.dart';

class card extends StatelessWidget {
  card({
    required this.text,
    required this.icon,

    Key? key,
  }) : super(key: key);
  String text;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            SizedBox(width: 10,),

            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: icon,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 23.5),

            ),

            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 85,
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Icon(Icons.arrow_forward_ios_rounded,color: Colors.deepOrange,)
            )
          ],
        ),
      ),

      margin: EdgeInsets.only(left: 25, right: 25),
      //height: 64,
    );
  }
}
