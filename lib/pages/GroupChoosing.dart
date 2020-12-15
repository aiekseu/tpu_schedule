import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChooseYourGroup extends StatelessWidget {
  final headlineColor = Color.fromARGB(255, 28, 25, 57);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Добро пожаловать!',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: headlineColor),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: Center(
                  child: Text(
                    'Для продолжения выберите\nсвою группу',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Expanded(
                child: GroupsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupsList extends StatefulWidget {
  @override
  _GroupsListState createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  List<String> groups = [
    '8К81',
    '8К81',
    '8К82',
    '8К71',
    '8К72',
    '8К73',
    '8К81',
    '8К82',
    '8К71',
    '8К72',
    '8К73',
    '8К81',
    '8К82',
    '8К71',
    '8К72',
    '8К73',
    '8К81',
    '8К82',
    '8К71',
    '8К72',
    '8К73',
    '8К91',
    '0401',
    '0402',
    '0403',
    '0404',
    '0405',
    '0406',
    '0404',
    '0405',
    '0406',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    groups.sort();

    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ListView.separated(
        itemCount: groups.length,
        separatorBuilder: (context, index) => const Divider(indent: 20, endIndent: 20),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print('${groups[index]}');
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 64.0),
                padding: EdgeInsets.all(2),
                child: Center(
                    child: Text(
                      '${groups[index]}',
                      style: TextStyle(fontSize: 18),
                    ))),
          );
        },
      ),
    );
  }
}