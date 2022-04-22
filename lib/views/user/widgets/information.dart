import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/widgets.dart';

class Information extends StatelessWidget {
  Information({Key key}) : super(key: key);
  final List lst = List.unmodifiable([
    {
      'title': '11/10/2000',
      'icon': 'assets/icons/face_party.png',
      'colors': Colors.black,
    },
    {
      'title': 'Phú yên',
      'icon': 'assets/icons/face_heart.png',
      'colors': Colors.blue,
    },
    {
      'title': '030619112',
      'icon': 'assets/icons/face_happy.png',
      'colors': Colors.teal,
    }
  ]);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(padding),
            child: buildText(
              text: 'Thông tin',
              size: 20.0,
              color: subTextColor,
              weight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 0),
              scrollDirection: Axis.horizontal,
              itemCount: lst.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: padding - 10),
                width: 160,
                height: 40,
                decoration: BoxDecoration(
                  color: lst[index]['colors'],
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: padding - 15),
                      child: Image.asset(
                        lst[index]['icon'],
                        width: 30,
                        height: 30,
                      ),
                    ),
                    buildText(
                      text: lst[index]['title'],
                      size: 19.0,
                      color: Colors.white,
                      weight: FontWeight.bold,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
