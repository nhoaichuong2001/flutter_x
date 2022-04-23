import 'package:flutter/material.dart';
import 'package:my_app/constant.dart';
import 'package:my_app/controller/campaignController.dart';
import 'package:my_app/models/campaign.dart';
import 'package:my_app/widgets.dart';
import 'package:provider/provider.dart';

class CreateCampaign extends StatefulWidget {
  const CreateCampaign({Key key}) : super(key: key);

  @override
  State<CreateCampaign> createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  final _fomKey = GlobalKey<FormState>();
  final nameCampaignController = TextEditingController();
  final contentController = TextEditingController();
  final noteController = TextEditingController();
  final numberController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    noteController.dispose();
    nameCampaignController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CampaignController cap = Provider.of<CampaignController>(context);
    return Form(
      key: _fomKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(
            text: 'Tên chiến dịch',
            size: 20.0,
            color: textColor,
            weight: FontWeight.bold,
          ),
          _input(
            w: double.infinity,
            h: 50.0,
            text: 'Tên....',
            controller: nameCampaignController,
          ),
          buildText(
            text: 'Số lượng mail cần gửi',
            size: 22.0,
            color: textColor,
            weight: FontWeight.bold,
          ),
          _input(
            w: double.infinity,
            h: 50.0,
            text: 'Số lượng...',
            controller: numberController,
            typeKeyboard: TextInputType.number,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildText(
                text: 'Note',
                size: 22.0,
                color: textColor,
                weight: FontWeight.bold,
              ),
              InkWell(
                onTap: () => _showModalBottom(context, noteController, cap),
                child: buildText(
                  text: 'Tạo note',
                  size: 22.0,
                  color: Colors.blue,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: padding),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                children: cap.getListNote
                    .map(
                      (e) => Card(
                        child: Container(
                          padding: const EdgeInsets.all(padding / 2),
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
                    .toList()),
          ),
          buildText(
            text: 'Nội dung',
            size: 20.0,
            color: textColor,
            weight: FontWeight.bold,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: padding),
            decoration: BoxDecoration(
                color: appBarColor,
                boxShadow: [
                  BoxShadow(
                    color: textColor.withOpacity(0.3),
                    blurRadius: 3.0,
                    offset: const Offset(0, 3),
                  )
                ],
                borderRadius: const BorderRadius.all(Radius.circular(15.0))),
            child: TextFormField(
                maxLines: 5,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: textColor,
                ),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(padding / 2 + 5),
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  suffixStyle: TextStyle(
                    color: textColor,
                  ),
                  errorMaxLines: 2,
                  errorStyle: TextStyle(fontSize: 18),
                  hintText: 'Nội dung',
                  hintStyle: TextStyle(
                    fontSize: 20.0,
                    color: subTextColor,
                  ),
                ),
                // ignore: missing_return
                validator: (value) {
                  if (value.isEmpty) return 'Không được bỏ trống';
                }),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                cap.createCampaign(Campaign(
                  content: contentController.text,
                  name: nameCampaignController.text,
                  dateTime: '23/04/2022',
                  quantity: int.parse(numberController.text),
                  status: 'Đang chuẩn bị',
                  note: cap.getListNote,
                ));
                nameCampaignController.text = '';
                numberController.text = '';
                contentController.text = '';
              },
              child: buildText(
                text: 'Xác nhận',
                size: 20.0,
                color: Colors.white,
                weight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _showModalBottom(
      BuildContext context, TextEditingController noteController, cap) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
              padding: const EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(
                    text: 'Nhập tên note',
                    size: 22.0,
                    color: textColor,
                  ),
                  _input(
                    controller: noteController,
                    text: 'note..',
                    w: double.infinity,
                    h: 60.0,
                    typeKeyboard: TextInputType.emailAddress,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        cap.createNote(noteController.text);
                        noteController.text = '';
                        Navigator.pop(context);
                      },
                      child: buildText(
                        text: 'Xác nhận',
                        size: 20.0,
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ));
        });
  }

  Widget _input({controller, text, w, h, typeKeyboard}) => Container(
        margin: const EdgeInsets.symmetric(vertical: padding),
        decoration: BoxDecoration(
            color: appBarColor.withOpacity(1),
            boxShadow: [
              BoxShadow(
                color: textColor.withOpacity(0.3),
                blurRadius: 3.0,
                offset: const Offset(0, 3),
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        width: (w != null) ? w : 300.toDouble(),
        height: (h != null) ? h : 50.toDouble(),
        child: TextFormField(
            style: const TextStyle(
              fontSize: 20.0,
              color: textColor,
            ),
            controller: controller,
            keyboardType: typeKeyboard,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(padding / 2 + 5),
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              suffixStyle: const TextStyle(
                color: textColor,
              ),
              errorMaxLines: 2,
              errorStyle: const TextStyle(fontSize: 18),
              hintText: text,
              hintStyle: const TextStyle(
                fontSize: 20.0,
                color: subTextColor,
              ),
            ),
            // ignore: missing_return
            validator: (value) {
              if (value.isEmpty) return 'Không được bỏ trống';
            }),
      );
}
