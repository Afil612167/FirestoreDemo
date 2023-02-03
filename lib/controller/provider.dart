import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ItemsProvider extends ChangeNotifier {
  String phoneNumber = '';
  String otpVerificationId = '';
  String smsCode = '';
  bool otpCheck = true;
  //User Details SignUp
  String name = '';
  String email = '';
  String phoneNo = '';
  String address = '';
  bool? registrationRepeatStopeGet;

  void addDataSetADocument() {
    final city = <String, String>{
      "name": name,
      "email": email,
      "address": address,
      "Phone": phoneNo,
    };
    FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(city)
        .onError((e, _) => print("Error writing document: $e"));
  }

  otpCheckUpdate() {
    otpCheck = otpCheck;
    notifyListeners();
  }

  otpVerificationIdUpdate() {
    otpVerificationId = otpVerificationId;
    notifyListeners();
  }

  phoneNumberUpdate() {
    phoneNumber = phoneNumber;
    notifyListeners();
  }

  smsCodeUpdate() {
    smsCode = smsCode;
    notifyListeners();
  }

  registrationUpdate() {
    name = name;
    email = email;
    phoneNo = phoneNo;
    address = address;
    notifyListeners();
  }

  //firestore data set
  saveUserDetails() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.email)
        .set({
      "name": name,
      "email": email,
      'phone no': phoneNo,
      "address": address
    });
  }

}
