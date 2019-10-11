import 'package:flutter/material.dart';
import 'home_trips.dart';
import 'package:cicom/screens/user/profile_trips.dart';
import 'package:cicom/screens/articles/article_list.dart';

class MenuTrips extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MenuTrips();
  }

}

class _MenuTrips extends State<MenuTrips>{

  int indexTap=0;
  final List<Widget> widgetsChildes=[
    HomeTrips(),
    ArticleList(),
    ProfileTrips()
  ];

  void onTapTapped(int index){
    setState(() {
      indexTap=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildes[indexTap],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: Colors.blue
          ),
            child: BottomNavigationBar(
              onTap: onTapTapped,
              currentIndex: indexTap,
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
            )
        ),
    );
  }

}