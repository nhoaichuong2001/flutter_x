import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/widgets.dart';

class AlertCustomNotification extends StatefulWidget {
  const AlertCustomNotification({Key key, this.title}) : super(key: key);
  final String title;
  @override
  State<AlertCustomNotification> createState() =>
      _AlertCustomNotificationState();
}

class _AlertCustomNotificationState extends State<AlertCustomNotification> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: padding),
            child: buildText(
              text: 'Thông báo',
              size: 22.0,
              color: textColor,
              weight: FontWeight.bold,
            ),
          ),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 22.0,
              color: subTextColor,
              wordSpacing: 2.0,
            ),
            textAlign: TextAlign.left,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _button(
                  text: 'Hủy bỏ',
                  background: Colors.white,
                  color: textColor,
                  border: true,
                ),
                _button(
                  text: 'Đồng ý',
                  background: Colors.blue,
                  color: Colors.white,
                  border: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _button({text, background, color, border}) => Container(
        height: 40,
        width: 85,
        decoration: BoxDecoration(
          color: background,
          border: border
              ? Border.all(color: subTextColor, width: 2.0)
              : Border.all(color: Colors.transparent, width: 0.0),
        ),
        child: Center(
          child: buildText(
            text: text,
            size: 20.0,
            color: color,
          ),
        ),
      );
}
