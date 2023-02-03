import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

LinearGradient linearGradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [
          0.5,
          0.8,
          1,
        ],
        colors: [
          mainWhite,
          mainPink.withOpacity(0.6),
          mainPink.withOpacity(1)
        ],
      );