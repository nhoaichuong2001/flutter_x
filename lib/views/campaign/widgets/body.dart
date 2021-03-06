import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/controller/campaignController.dart';
import 'package:my_app/views/campaign/widgets/create.dart';
import 'package:my_app/views/campaign/widgets/list_campaign.dart';
import 'package:my_app/widgets.dart';
import 'package:provider/provider.dart';

class BodyMainCampaign extends StatefulWidget {
  const BodyMainCampaign({Key key}) : super(key: key);

  @override
  State<BodyMainCampaign> createState() => _BodyMainCampaignState();
}

class _BodyMainCampaignState extends State<BodyMainCampaign> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    CampaignController cap = Provider.of<CampaignController>(context);
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: padding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 50,
                width: double.infinity,
                child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectedIndex = index;
                      cap.removeALNote();
                    });
                  },
                  indicatorColor: appBarColor,
                  tabs: [
                    Tab(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color:
                              (selectedIndex == 0) ? Colors.blue : appBarColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: buildText(
                            text: 'Danh s??ch',
                            size: 18.0,
                            color:
                                (selectedIndex == 0) ? Colors.white : textColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: padding / 2),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          color:
                              (selectedIndex == 1) ? Colors.blue : appBarColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: buildText(
                            text: 'Th??m chi???n d???ch',
                            size: 18.0,
                            color:
                                (selectedIndex == 1) ? Colors.white : textColor,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 400,
                height: 605,
                child: TabBarView(
                  children: [
                    ListCampaign(),
                    CreateCampaign(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
