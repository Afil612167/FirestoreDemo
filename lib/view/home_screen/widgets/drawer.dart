import 'package:coding_test/servieces/firebase_google.dart';
import 'package:coding_test/view/signin_screen_otp/signin_screen_otp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/provider.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Consumer<ItemsProvider>(builder: (context, detailsProvider, _) {
        return ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
                width: width * 0.1,
                child: TextButton(
                  onPressed: () async {
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setBool("loginCheck", false);
                    FirebaseDemo().signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreenOtp(),
                        ));
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                )),
          ],
        );
      }),
    );
  }
}
