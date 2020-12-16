import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePick extends StatelessWidget{
  @override
  final Size preferredSize;
  final String todayDate;
  final String dayOfWeek;

  DatePick(this.todayDate, this.dayOfWeek, {Key key,})
      :
        preferredSize = Size.fromHeight(125.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(45),
              bottomRight: Radius.circular(45)),
          color: Colors.deepPurple[200],
        ),
        child: Row(
          children: [],
        ),
      );
  }
}
