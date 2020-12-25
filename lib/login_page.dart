import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.red,
              child: Text("Sliver Fill Remaining"),
            ),
          )
        ],
      )),
    );
  }
}
