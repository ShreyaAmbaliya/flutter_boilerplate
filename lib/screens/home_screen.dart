import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/widgets/base_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseWrapper(
      appbar: AppBar(
        title:Text("Home")
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/robo.png"),
        ],
      ),
    );
  }
}
