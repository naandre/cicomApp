import 'package:cicom/User/ui/widgets/profile_appbar.dart';
import 'package:flutter/material.dart';

class ProfileTrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Container(color: Colors.blueAccent,)
          ],
        ),
        ProfileAppBar()
      ],
    );
  }

}