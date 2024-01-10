import 'package:flutter/material.dart';


class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          drawer: Container(),
          appBar: AppBar(
            backgroundColor: Colors.blue,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: 800,
          ),
        )
    );
  }
}
