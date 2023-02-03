import 'package:coding_test/controller/provider.dart';
import 'package:coding_test/view/singin_screen_otp_verification/signin_screen_otp_verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';

class SendCodeButton extends StatelessWidget {
  SendCodeButton({
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
        width: width / 2,
        child: ElevatedButton(
          onPressed: () async {
            await FirebaseAuth.instance.verifyPhoneNumber(
              phoneNumber: '+91 ${itemsProvider.phoneNumber}',
              verificationCompleted: (PhoneAuthCredential credential) {},
              verificationFailed: (FirebaseAuthException e) {},
              codeSent: (String verificationId, int? resendToken) {
                itemsProvider.otpVerificationId = verificationId;
                itemsProvider.otpVerificationIdUpdate();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreenOtpVarification(),
                  ),
                );
              },
              codeAutoRetrievalTimeout: (String verificationId) {},
            );
            // Navigator.push(context, MaterialPageRoute(builder: (context) => ,))
          },
          child: Text("Send the code"),
          style: ElevatedButton.styleFrom(
            backgroundColor: mainPink,
          ),
        ),
      );
    });
  }
}
