import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/widgets.dart';

class Payment extends StatefulWidget {
  const Payment({Key key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: padding, horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCurrentPrice(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: padding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      ),
                      child: const Icon(
                        Icons.wallet_membership,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    buildText(
                      text: 'Kết nối ví',
                      size: 20.0,
                      color: textColor,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () => _showModalBottom(context),
                  child: Container(
                    height: 40,
                    width: 110,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: Center(
                      child: buildText(
                        text: 'Đã kết nối',
                        size: 16.0,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
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
                  text: 'Kết nối ví',
                  size: 22.0,
                  color: textColor,
                  weight: FontWeight.bold,
                ),
                buildText(
                  text:
                      'Chọn loại ví mà bạn sẽ sử dụng để thanh toán các khoản chỉ tiêu bây giờ và sau này.',
                  size: 18.0,
                  color: subTextColor,
                ),
                _buildRules(),
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isCheck,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          isCheck = !isCheck;
                        });
                      },
                    ),
                    buildText(
                      text: 'Tôi đã đọc và chấp thuận.',
                      size: 18.0,
                      color: textColor,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(child: _button()),
              ],
            ),
          );
        });
  }

  Widget _button() => Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 2.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icons/momo.png'),
              buildText(
                text: 'Ví momo',
                size: 20.0,
                color: textColor,
              ),
            ],
          ),
        ),
      );
  Padding _buildRules() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: padding + 10),
      child: Wrap(
        children: [
          buildText(
            text: 'Chấp thuận',
            size: 20.0,
            color: textColor,
          ),
          buildText(
            text: ' Điều khoản dịch vụ',
            size: 20.0,
            color: Colors.blue,
          ),
          buildText(
            text: ' và ',
            size: 20.0,
            color: textColor,
          ),
          buildText(
            text: 'Chính sách bảo mật',
            size: 20.0,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Row _buildCurrentPrice() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildText(
          text: 'Thanh toán',
          size: 20.0,
          color: subTextColor,
          weight: FontWeight.bold,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(
              text: 'Hiện có',
              size: 16.0,
              color: subTextColor,
              weight: FontWeight.bold,
            ),
            Container(
              height: 40,
              width: 150,
              color: appBarColor,
              child: Center(
                child: buildText(
                  text: '1.000.000đ',
                  size: 19.0,
                  color: textColor,
                  weight: FontWeight.bold,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
