import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../colors.dart';

Widget Item(BuildContext context ,
{required String text}) {
  return GestureDetector(
    onTap: () {
      showMaterialModalBottomSheet(
        context: context,
        builder: (context) => Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'مساكن أطلس - مدينة نصر',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color: Mycolor.darkblue,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Mycolor.darkblue,
                          ),
                          child: Text(
                            'Navigate',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                //height: 80,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.filter,
                          color: Mycolor.darkblue,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shop Reviews',
                              style: TextStyle(
                                color: Mycolor.darkblue,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            RatingBar.builder(
                              initialRating: 3.3,
                              itemSize: 18,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.black,
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                //height: 80,
                child: Column(

                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Mycolor.black,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number(s)',
                              style: TextStyle(
                                color: Mycolor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '01020888802',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                //height: 80,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.alarm,
                          color: Mycolor.darkblue,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Working Times',
                              style: TextStyle(
                                color: Mycolor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '24 Hours',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                //height: 80,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.car_rental,
                          color: Mycolor.black,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Car Types',
                              style: TextStyle(
                                color: Mycolor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'All,BMW,Opel',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                //height: 80,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.chat,
                          color: Mycolor.black,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Send WhatsApp Message',
                              style: TextStyle(
                                color: Mycolor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                //height: 80,
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(
                          Icons.miscellaneous_services,
                          color: Mycolor.black,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 1,
                          height: 35,
                          color: Colors.black26,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Services',
                              style: TextStyle(
                                color:  Mycolor.darkblue,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   height: 1,
                    //   color: Colors.black26,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
    child: Container(
        width: double.infinity,
        height: 220,
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 8, offset: Offset(5, 5))
            ]),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  // CircleAvatar(
                  //   backgroundColor: Colors.yellow,
                  //   radius: 40,
                  //   child: Icon(
                  //     Icons.car_rental,
                  //     size: 50,
                  //     color: Colors.black,
                  //   ),
                  // ),
                  Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:  Mycolor.red,
                        borderRadius: BorderRadius.circular(70),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(5, 5),
                          ),
                        ]),
                    child: Icon(
                      Icons.car_rental,
                      size: 50,
                      color: Colors.black,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sorry,No image provided for this shop',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'ونش',
                        style: TextStyle(color: Mycolor.red),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.alarm,
                            color: Mycolor.red,
                          ),
                          Text(' 24 Hours')
                        ],
                      )
                    ],
                  ),
                  Text('22.31 km'),
                ],
              ),
            )
          ],
        )),
  );
}
