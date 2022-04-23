import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/controller/campaignController.dart';
import 'package:my_app/views/campaign/widgets/body.dart';
import 'package:my_app/widgets.dart';
import 'package:provider/provider.dart';

class MainCampaign extends StatelessWidget {
  const MainCampaign({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CampaignController(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: appBarColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appBarColor,
            title: buildText(
              text: 'Thêm chiến dịch'.toUpperCase(),
              size: 22.0,
              color: Colors.blue,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: padding),
                child: Image.asset(
                  'assets/icons/human.png',
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
          body: const BodyMainCampaign(),
        ),
      ),
    );
  }
}
