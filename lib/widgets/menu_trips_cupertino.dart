import 'package:cicom/Article/ui/screens/search_trips.dart';
import 'package:cicom/Auth/ui/screens/login.dart';
import 'package:cicom/screens/home_trips.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MenuTripsCupertino extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text("")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text("")
              ),
            ],
          ),
        // ignore: missing_return
        tabBuilder: (BuildContext context,int index){
            // ignore: missing_return
            switch (index){
              case 0:
                return CupertinoTabView(builder: (BuildContext context)=>HomeTrips());
                break;
              case 1:
                return CupertinoTabView(builder: (BuildContext context)=>SearchTrips());
                break;
              case 2:
                return CupertinoTabView(builder: (BuildContext context)=>Login());
                break;
            }
        },
      ),
    );
  }

}