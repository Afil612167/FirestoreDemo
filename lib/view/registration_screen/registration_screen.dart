import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/provider.dart';
import '../home_screen/home_screen.dart';
import 'widgets/gradient.dart';
import 'widgets/text_form_name.dart';
import 'widgets/text_form_phone.dart';
import 'widgets/textform_address.dart';
import 'widgets/textform_email.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: heights * 1,
          width: widths * 1,
          decoration: BoxDecoration(
            gradient: linearGradient,
          ),
          child: Column(
            children: [
              SizedBox(
                height: heights * 0.18,
              ),
              Center(
                  child: InkWell(
                onTap: () => print(FirebaseAuth.instance.currentUser?.uid),
                child: Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: heights * 0.06, fontWeight: FontWeight.w700),
                ),
              )),
              SizedBox(
                height: heights * 0.06,
              ),
              SizedBox(
                  height: heights * 0.6,
                  width: widths * 0.8,
                  // color: Colors.green,/
                  child: Column(
                    children: [
                      TextFormName(
                        widths: widths,
                        heights: heights,
                      ),
                      SizedBox(
                        height: heights * 0.04,
                      ),
                      TextFormEmail(widths: widths, heights: heights),
                      SizedBox(
                        height: heights * 0.04,
                      ),
                      TextFormAddress(widths: widths, heights: heights),
                      SizedBox(
                        height: heights * 0.04,
                      ),
                      TextFormPhone(widths: widths, heights: heights),
                      Padding(
                        padding: EdgeInsets.only(
                            left: widths * 0.5, top: heights * 0.03),
                        child: SizedBox(
                          height: heights * 0.05,
                          child: Consumer<ItemsProvider>(
                            builder: (context, itemProvider, child) {
                              return ElevatedButton(
                                onPressed: () async {

                                  SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                  pref.setBool('registrationCheck',true);
                                  itemProvider.registrationUpdate();
                                  itemProvider.addDataSetADocument();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black),
                                child: const Text('Register'),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
