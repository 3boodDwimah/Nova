import 'package:flutter/material.dart';
import 'package:untitled4/Ui/home/home.dart';
import 'package:untitled4/const/navigator.dart';
import 'package:untitled4/const/styles/colors.dart';


class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            navigateAndFinish(context, ShopLayout());
          },
          child: Icon(
            Icons.arrow_back_outlined,
            size: 27,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                child: Row(
                  children: [
                    Image.asset('assets/images/credit-card - 4.png'),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('assets/images/credit-card - 3.png'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Newbalance x Shoe Palace 997',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Size :',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Steelseries Artistic 7 Wireless',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Color : White',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    ),),
                  ],
                ),
                Column(

                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '553',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,

                    ),
                    SizedBox(width:MediaQuery.of(context).size.width/2.8,),

                    Text(
                      '\$ 3.29',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 0,
              thickness: 0,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subtotal',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(width:MediaQuery.of(context).size.width/1.3,),
                    Text(
                      'Tax',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '553',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '\$ 3.29',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Divider(
              height: 0,
              thickness: 0,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(width:MediaQuery.of(context).size.width/1.4,),
                Text(
                  '600',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              height: 63.83,
              child: Text(
                'Pay Now',
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
