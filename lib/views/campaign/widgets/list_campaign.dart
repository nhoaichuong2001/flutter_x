import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/controller/campaignController.dart';
import 'package:my_app/widgets.dart';
import 'package:provider/provider.dart';

class ListCampaign extends StatefulWidget {
  const ListCampaign({Key key}) : super(key: key);

  @override
  State<ListCampaign> createState() => _ListCampaignState();
}

class _ListCampaignState extends State<ListCampaign> {
  @override
  Widget build(BuildContext context) {
    CampaignController cap = Provider.of<CampaignController>(context);

    return (cap.getList.isEmpty)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/note.png',
                ),
                buildText(
                  text:
                      'Hiện tại chưa có chiến dịch nào, hãy thêm chiếm dịch mới ngay bây giờ.',
                  size: 20.0,
                  color: textColor,
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                buildText(text: 'Chiến dịch', size: 20.0, color: textColor),
                SizedBox(
                  height: 572,
                  child: ListView.separated(
                    itemBuilder: (context, index) => Card(
                      shadowColor: appBarColor,
                      elevation: 5.0,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 50,
                                  child: Text(
                                    cap.getList[index].name,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      color: textColor,
                                      overflow: TextOverflow.visible,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: Text(
                                    'Ngày bắt đầu: ${cap.getList[index].dateTime}',
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 19.0,
                                      color: Colors.red,
                                      overflow: TextOverflow.visible,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: padding / 2),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: cap.getList[index].note
                                        .map(
                                          (e) => Card(
                                            child: Container(
                                              padding: const EdgeInsets.all(
                                                  padding / 2),
                                              color: Colors.blue,
                                              child: Center(
                                                child: buildText(
                                                  text: e,
                                                  size: 18.0,
                                                  color: Colors.white,
                                                  weight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 30,
                                    color: appBarColor,
                                    child: const Center(
                                      child: Icon(
                                        Icons.arrow_upward_rounded,
                                        size: 30.0,
                                        color: textColor,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.fiber_manual_record,
                                      size: 20,
                                      color: Colors.red,
                                    ),
                                    buildText(
                                      text: cap.getList[index].status,
                                      size: 18.0,
                                      color: Colors.red,
                                      weight: FontWeight.bold,
                                    ),
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildText(
                                        text: 'Xem ngay',
                                        size: 18.0,
                                        color: Colors.grey,
                                        weight: FontWeight.bold,
                                      ),
                                      const Icon(
                                        Icons.arrow_right_sharp,
                                        size: 20,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: cap.getList.length,
                  ),
                ),
              ],
            ),
          );
  }
}
