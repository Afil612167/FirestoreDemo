import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_test/constants/colors.dart';
import 'package:coding_test/servieces/firebase_current_user.dart';
import 'package:coding_test/view/home_screen/Lists/details_list.dart';
import 'package:coding_test/view/home_screen/widgets/drawer.dart';
import 'package:coding_test/view/home_screen/widgets/name_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    final CollectionReference userData =
        FirebaseFirestore.instance.collection('user');
    return SafeArea(
      child: Scaffold(
          drawer: const NavDrawer(),
          appBar: AppBar(
            backgroundColor: mainPink,
          ),
          body: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: height / 15)),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: mainPink, borderRadius: BorderRadius.circular(10)),
                  height: height / 15,
                  width: width * 0.8,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: width / 15)),
                      SizedBox(width: width / 5, child: Text('name')),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: width / 2,
                          height: height / 0.05,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: collection.snapshots(),
                              builder: (context, snapshot) {
                                DocumentSnapshot data = snapshot.data!.docs[0];
                                return !snapshot.hasData
                                    ? Center(child: CircularProgressIndicator())
                                    :
                                    ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot data =
                                              snapshot.data!.docs[0];
                                          print(data['name']);
                                    return
                                    Center(child: Text(data['name']));
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: height / 15)),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: mainPink, borderRadius: BorderRadius.circular(10)),
                  height: height / 15,
                  width: width * 0.8,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: width / 15)),
                      SizedBox(width: width / 5, child: Text('Address')),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: width / 2,
                          height: height / 0.05,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: collection.snapshots(),
                              builder: (context, snapshot) {
                                DocumentSnapshot data = snapshot.data!.docs[0];
                                return !snapshot.hasData
                                    ? Center(child: CircularProgressIndicator())
                                    :
                                    ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot data =
                                              snapshot.data!.docs[0];
                                    return
                                    Center(child: Text(data['address']));
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: height / 15)),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: mainPink, borderRadius: BorderRadius.circular(10)),
                  height: height / 15,
                  width: width * 0.8,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: width / 15)),
                      SizedBox(width: width / 5, child: Text('email')),
                      SingleChildScrollView(
                        child: SizedBox(
                          width: width / 2,
                          height: height / 0.05,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: collection.snapshots(),
                              builder: (context, snapshot) {
                                DocumentSnapshot data = snapshot.data!.docs[0];
                                return !snapshot.hasData
                                    ? Center(child: CircularProgressIndicator())
                                    :
                                    ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot data =
                                              snapshot.data!.docs[0];
                                          print(data['email']);
                                    return
                                    Center(child: Text(data['email']));
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(top: height / 15)),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: mainPink, borderRadius: BorderRadius.circular(10)),
                  height: height / 15,
                  width: width * 0.8,
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: width / 15)),
                      SizedBox(width: width / 5, child: Text('phone')),
                       SingleChildScrollView(
                        child: SizedBox(
                          width: width / 2,
                          height: height / 0.05,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: StreamBuilder<QuerySnapshot>(
                              stream: collection.snapshots(),
                              builder: (context, snapshot) {
                                DocumentSnapshot data = snapshot.data!.docs[0];
                                return !snapshot.hasData
                                    ? Center(child: CircularProgressIndicator())
                                    :
                                    ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot data =
                                              snapshot.data!.docs[0];
                                          print(data['name']);
                                    return
                                    Center(child: Text(data['name']));
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
