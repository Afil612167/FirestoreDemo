import 'package:coding_test/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider.dart';

class TextFormAddress extends StatelessWidget {
  const TextFormAddress({
    Key? key,
    required this.widths,
    required this.heights,
  }) : super(key: key);
  final double widths;
  final double heights;

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(builder: (context, textProvi, child) {
      return Container(
        width: widths * 0.8,
        height: heights * 0.08,
        decoration: BoxDecoration(
            border: Border.all(color: mainBlack),
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(
              width: widths * 0.05,
            ),
            const Text(
              'Address',
              style: TextStyle(fontSize: 16, color: mainBlack),
            ),
            SizedBox(
              width: widths * 0.05,
            ),
            SizedBox(
              width: widths * 0.5,
              child: Center(
                child: TextFormField(
                  decoration: const InputDecoration(border: InputBorder.none),
                  onChanged: (value) async {
                    textProvi.address = value;
                    print(textProvi.email.characters.length.toString());
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
