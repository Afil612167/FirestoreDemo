import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../constants/colors.dart';

class NameCotainer extends StatefulWidget {
  NameCotainer({required this.height, required this.width, super.key});
  double height;
  double width;

  @override
  State<NameCotainer> createState() => _NameCotainerState();
}

class _NameCotainerState extends State<NameCotainer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("user").snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data!.docs[index];
                  print(data['name']);
                  return Text(data['name']);
                },
              );
      },
    );
  }
}
