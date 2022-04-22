import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/widgets.dart';

class AvatarName extends StatelessWidget {
  const AvatarName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: padding, horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: appBarColor,
            radius: 50,
            child: Image.asset(
              'assets/icons/human.png',
              width: 60,
              height: 60,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildText(
                text: 'Nguyễn Long Bá',
                size: 22.0,
                color: textColor,
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              buildText(
                text: 'Khách hàng',
                size: 18.0,
                color: subTextColor,
                weight: FontWeight.bold,
              ),
            ],
          ),
          const SizedBox(width: 10),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_note_sharp,
                size: 30.0,
                color: subTextColor,
              ))
        ],
      ),
    );
  }
}
