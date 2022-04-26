import 'package:flutter/cupertino.dart';
import 'package:my_app/models/campaign.dart';

class CampaignController with ChangeNotifier {
  int page = 0;
  List<String> lstNote = [];
  final List<Campaign> lst = [
    // Campaign(
    //   name: 'Chiến dịch chống mỹ',
    //   note: ['Duy trì', 'Bảo dưỡng'],
    //   quantity: 3,
    //   dateTime: '10/10/2021',
    //   status: 'Đang khởi chạy',
    // ),
    // Campaign(
    //   name: 'Chiến dịch chống pháp',
    //   note: ['Duy trì', 'Bảo dưỡng'],
    //   quantity: 4,
    //   dateTime: '21/10/2021',
    //   status: 'Đang chuẩn bị',
    // ),
  ];
  List<Campaign> get getList => lst;
  List<String> get getListNote => lstNote;
  void changePage(index) {
    page = index;
    notifyListeners();
  }

  void createNote(String note) {
    lstNote.add(note);

    notifyListeners();
  }

  void createCampaign(Campaign cap) {
    lst.add(cap);
    lstNote = [];
    notifyListeners();
  }

  void removeALNote() {
    lstNote = [];
    notifyListeners();
  }
}
