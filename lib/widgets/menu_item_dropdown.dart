import 'package:flutter/material.dart';

class MenuItemDropDown {
// Retorna los item para un menu Drop
  List<DropdownMenuItem<String>> getMenuItems(items){
    return items.map<DropdownMenuItem<String>>((item) {
      return DropdownMenuItem<String>(
          value: item,
          child: Builder(builder: (BuildContext context) {
            return Text(item);
          },)
      );
    }).toList();
  }
}