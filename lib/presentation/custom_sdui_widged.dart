

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdui/sdui.dart';

class CustomSduiWidget extends SDUIWidget {

  double width = 10.0;
  double height = 10.0;
  double margin = 10.0;
  int color = 0xFFFFFFFF;

  @override
  SDUIWidget fromJson(Map<String, dynamic>? json) {
    width = json?['width'] ?? 10.0;
    height = json?['height'] ?? 10.0;
    color = json?['color'] ?? 0xFF00FFFF;
    return this;
  }

  @override
  Widget toWidget(BuildContext context) {
   return Container(
     padding: EdgeInsets.all(0.00),
     margin: EdgeInsets.all(margin),
     width: width,
     height: height,
     color: Color(color),
   );
  }
  
}