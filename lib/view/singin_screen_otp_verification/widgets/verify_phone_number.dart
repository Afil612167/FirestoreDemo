import 'package:coding_test/controller/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/colors.dart';
import '../../home_screen/home_screen.dart';
import '../../registration_screen/registration_screen.dart';

class VerifyPhNumberButton extends StatelessWidget {
  VerifyPhNumberButton({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(builder: (context, itemsProvider, _) {
      return SizedBox(
        height: height / 20,
        width: width * 0.9,
        child: ElevatedButton(
          onPressed: () async {
            try {
              // Create a PhoneAuthCredential with the code
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                  verificationId: itemsProvider.otpVerificationId,
                  smsCode: itemsProvider.smsCode);
              // Sign the user in (or link) with the credential
              await FirebaseAuth.instance.signInWithCredential(credential);
              bool regCheck = false;
              SharedPreferences pref = await SharedPreferences.getInstance();
              regCheck = pref.getBool('registrationCheck')!;
              pref.setBool("loginCheck", true);
              if (regCheck) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegistrationScreen(),
                  ),
                );
              }
            } catch (e) {
              itemsProvider.otpCheck = false;
              itemsProvider.otpCheckUpdate();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: mainPink,
          ),
          child: const Text("Verify phone number"),
        ),
      );
    });
  }
}
