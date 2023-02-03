import 'package:coding_test/constants/colors.dart';
import 'package:coding_test/view/singin_screen_otp_verification/widgets/verify_phone_number.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../../constants/asset_images.dart';
import '../../controller/provider.dart';

class SignInScreenOtpVarification extends StatelessWidget {
  SignInScreenOtpVarification({super.key});

  static var smsCode = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back_ios_new_sharp,
                color: mainBlack,
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        resizeToAvoidBottomInset: false,
        body: Consumer<ItemsProvider>(builder: (context, itemProvider, _) {
          return Column(
            children: [
              Padding(padding: EdgeInsets.only(top: height / 25)),
              Center(
                child: Image(
                  image: AssetImage(welcome),
                  height: height / 3,
                  width: width / 2,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: height / 30)),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: height / 30)),
              Text(
                "We need to register your Phone Number before getting started !",
                style: TextStyle(
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: height / 30)),
              Pinput(
                onChanged: (value) {
                  itemProvider.smsCode = value;
                  itemProvider.smsCodeUpdate();
                },
                length: 6,
                showCursor: true,
              ),
              itemProvider.otpCheck
                  ? Padding(padding: EdgeInsets.only(top: height / 15))
                  : SizedBox(
                      height: height / 15,
                      child:const Center(
                        child: Text(
                          'Wrong otp',
                          style: TextStyle(color: mainPink),
                        ),
                      ),
                    ),
              VerifyPhNumberButton(height: height, width: width),
              SizedBox(
                height: height / 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Edit Phone number?",
                  style: TextStyle(color: mainBlack),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
