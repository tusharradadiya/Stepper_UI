import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int StepIndex = 0;
  TextEditingController txtName = TextEditingController();
  TextEditingController id = TextEditingController();
  TextEditingController passwrd = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  TextEditingController Uname = TextEditingController();
  TextEditingController lastpassword = TextEditingController();

  String note = "";
  String note2 = "";

  void createnote() {
    if (passwrd.text != cpassword.text ||
        passwrd.text == "" ||
        passwrd.text == "" ||
        cpassword.text == "") {
      note = "Password Not Match";
      notifyListeners();
    } else {
      note = "";
      notifyListeners();
    }
  }

  void conformation() {

    if (lastpassword.text != cpassword.text || txtName.text != Uname.text) {
      note2 = "Incorrect Information";
      notifyListeners();
    } else {
      note2 = "";
      notifyListeners();
    }
  }

  void changeStepIndex(int index) {
    StepIndex = index;
    notifyListeners();
  }
}
