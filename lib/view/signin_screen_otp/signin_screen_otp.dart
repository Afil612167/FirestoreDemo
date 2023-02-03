import 'package:coding_test/controller/provider.dart';
import 'package:coding_test/servieces/firebase_google.dart';
import 'package:coding_test/view/home_screen/home_screen.dart';
import 'package:coding_test/view/registration_screen/registration_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/asset_images.dart';
import '../../constants/colors.dart';
import 'widgets/mobile_otp_field.dart';
import 'widgets/send_code_button.dart';

class SignInScreenOtp extends StatefulWidget {
  SignInScreenOtp({super.key});
  static String phoneNumber = '';
  @override
  State<SignInScreenOtp> createState() => _SignInScreenOtpState();
}

class _SignInScreenOtpState extends State<SignInScreenOtp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: secondaryWhite,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              MobileOtpField(height: height, width: width),
              Padding(padding: EdgeInsets.only(top: height / 15)),
              SendCodeButton(height: height, width: width),
              Padding(padding: EdgeInsets.only(top: height / 35)),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                  Text("  Or continue with "),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      height: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 30,
              ),
              Consumer<ItemsProvider>(builder: (context, itemProvider, _) {
                return Center(
                  child: InkWell(
                    onTap: () async {
                      FirebaseDemo().googleSignIn();
                      if (FirebaseAuth.instance.currentUser != null) {
                        bool regCheck = false;
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
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
                      }
                      //  await   FirebaseDemo().signOut();
                    },
                    child: Image(
                      image: AssetImage(googleLogo),
                      height: height / 20,
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
