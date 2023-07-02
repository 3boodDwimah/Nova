import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../const/styles/colors.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My cart',style: Theme.of(context).textTheme.bodyText1?.copyWith(
            fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right:20),
          ),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:25,right: 25),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Slidable(
              startActionPane: ActionPane(
              motion: StretchMotion(),
              children: [
                SlidableAction(
                onPressed: ((context){
                  // choose product
                }),
                  backgroundColor: Colors.deepOrange,
                  icon: Icons.check_circle_outline_sharp,
                ),
              ]
              ),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25),),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child:Image.asset('assets/images/boot.png'),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Newbalance x Shoe Palace 997',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),),
                        SizedBox(height: 3,),
                        Text('Brieze Store',style: TextStyle(color: Color(0xFFCACACA),fontWeight: FontWeight.normal),),
                        SizedBox(height: 3,),
                        Text('300 \$',style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              ),

            ),
            SizedBox(height: 20,),
            Slidable(
              startActionPane: ActionPane(
                  motion: StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context){
                        // choose product
                      }),
                      backgroundColor: Colors.deepOrange,
                      icon: Icons.check_circle_outline_sharp,
                    ),
                  ]
              ),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25),),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child:Image.asset('assets/images/clock.png'),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Newbalance x Shoe Palace 997',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),),
                        SizedBox(height: 3,),
                        Text('Brieze Store',style: TextStyle(color: Color(0xFFCACACA),fontWeight: FontWeight.normal),),
                        SizedBox(height: 3,),
                        Text('300 \$',style: TextStyle(color: Color(0xFFFF7750),fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20,),
            Slidable(
              startActionPane: ActionPane(
                  motion: StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: ((context){
                        // choose product
                      }),
                      backgroundColor: Colors.deepOrange,
                      icon: Icons.check_circle_outline_sharp,
                    ),
                  ]
              ),
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25),),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child:Image.asset('assets/images/chair.png'),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Newbalance x Shoe Palace 997',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold),),
                        SizedBox(height: 3,),
                        Text('Brieze Store',style: TextStyle(color: Color(0xFFCACACA),fontWeight: FontWeight.normal),),
                        SizedBox(height: 3,),
                        Text('300 \$',style: TextStyle(color: Color(0xFFFF7750),fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 180,),

            Container(
              alignment: Alignment.center,
              height: 63.83,
              child: Text(
                'Checkout',
                style: TextStyle(
                  fontFamily: 'Nunito Sans',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: defaultColor,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x14afaeae),
                    offset: Offset(0, 10),
                    blurRadius: 100,
                  ),
                ],
              ),
            ),


          ],
        ),
      ),

    );
  }
}
