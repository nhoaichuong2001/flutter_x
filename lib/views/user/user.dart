import 'package:flutter/material.dart';
import 'package:my_app/alert.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/views/user/widgets/avatar_name.dart';
import 'package:my_app/views/user/widgets/information.dart';
import 'package:my_app/views/user/widgets/payment.dart';
import 'package:my_app/widgets.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: appBarColor,
        centerTitle: true,
        title: buildText(
          text: 'Cá nhân',
          size: 24.0,
          color: textColor,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AvatarName(),
          Information(),
          const Payment(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: padding, vertical: padding * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: buildText(
                    text: 'Tài khoản',
                    size: 18.0,
                    color: subTextColor,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    _showModalBottom(context);
                  },
                  child: buildText(
                    text: 'Chuyển tài khoản',
                    size: 18.0,
                    color: Colors.blue,
                    weight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertCustomNotification(
                          title: 'Bạn có muốn đăng xuất?',
                        );
                      }),
                  child: buildText(
                    text: 'Đăng xuất',
                    size: 18.0,
                    color: Colors.red,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _showModalBottom(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  text: 'Chuyển tài khoản',
                  size: 22.0,
                  color: textColor,
                ),
                buildText(
                  text:
                      'Bạn có thể sử dụng được 1 hoặc nhiều tài khoản để thiết lập với chúng tôi.',
                  size: 18.0,
                  color: subTextColor,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: padding),
                        padding:
                            const EdgeInsets.symmetric(horizontal: padding / 2),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildText(
                            text: '0382292563',
                            size: 18.0,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: padding),
                        padding:
                            const EdgeInsets.symmetric(horizontal: padding / 2),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2.0),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: buildText(
                            text: '0789429140',
                            size: 18.0,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
