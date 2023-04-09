import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black
            ),
              accountName: Text("Roberto Castro"),
              accountEmail: Text("racastro@galileo.edu")
          )
        ],
      )
    );
  }
}
