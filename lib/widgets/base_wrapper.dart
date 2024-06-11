import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseWrapper extends StatelessWidget {
   BaseWrapper({super.key, required this.child,this.appbar});
   AppBar? appbar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: appbar,
        body: Container(
          height:deviceSize.height,
          width: deviceSize.width,
          child: child,
        ),
      ),
    );
  }
}
